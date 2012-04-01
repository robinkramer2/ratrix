/*
 * ppMex.c
 *
 * Compile in MATLAB with mex ppMex.c [-O] [-g] [-v]
 * For documentation see pp.m
 *
 * following: http://as6edriver.sourceforge.net/Parallel-Port-Programming-HOWTO/accessing.html
 * http://people.redhat.com/twaugh/parport/html/parportguide.html
 *
 * Copyright (C) 2011 Erik Flister, University of Oregon, erik.flister@gmail.com
 * modified from lptwrite by Andreas Widmann
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "mex.h"

#include <sys/io.h>
#include <string.h>
#include <errno.h>

#include <math.h>

#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <sys/ioctl.h>
#include <linux/parport.h>
#include <linux/ppdev.h>

#define NUM_ADDRESS_COLS 2
#define NUM_DATA_COLS 3

#define ADDR_BASE "/dev/parport"

#define DEBUG true
#define ENABLE_WRITE false
#define USE_PPDEV false

#define DATA_OFFSET 0
#define STATUS_OFFSET 1
#define CONTROL_OFFSET 2
#define ECR_OFFSET 0x402

#define OFFSETS {DATA_OFFSET,STATUS_OFFSET,CONTROL_OFFSET,ECR_OFFSET}
#define NUM_REGISTERS 4

#define CONTROL_BIT_0 PARPORT_CONTROL_STROBE
#define CONTROL_BIT_1 PARPORT_CONTROL_AUTOFD
#define CONTROL_BIT_2 PARPORT_CONTROL_INIT
#define CONTROL_BIT_3 PARPORT_CONTROL_SELECT

#define STATUS_BIT_3 PARPORT_STATUS_ERROR
#define STATUS_BIT_4 PARPORT_STATUS_SELECT
#define STATUS_BIT_5 PARPORT_STATUS_PAPEROUT
#define STATUS_BIT_6 PARPORT_STATUS_ACK
#define STATUS_BIT_7 PARPORT_STATUS_BUSY

bool getBit(const unsigned char b, const unsigned char n) {
    return b & 1<<n;
}

void printBits(const unsigned char b) {
    int i;
    for (i = 7; i >= 0; i--) {
        printf("%c",getBit(b,i) ? '1' : '0');
    }
}

void doPort(
        const void * const addr,
        const unsigned char mask[NUM_REGISTERS],
        const unsigned char vals[NUM_REGISTERS],
        mxLogical * const out,
        const int n,
        const uint8_T * const data,
        const int numVals
        ) {
    static bool setup = false;
    
    uint64_T reg;
    unsigned char b;
    int result, i, j, offsets[NUM_REGISTERS] = OFFSETS; /*lame*/
    
    if USE_PPDEV {
        /*PPDEV doesn't require root, is supposed to be faster, and is address-space safe, but only available in later kernels >=2.4?*/
        /*however, i seem to need to sudo matlab in order to open eg /dev/parport0 */
        
        /* note our design here is not as intended -- we should really keep some persistant state of the port for future calls instead of acquiring and releasing it for every call */
        
        int parportfd = open(addr, O_RDWR);
        if (parportfd == -1) {
            printf("%s %s\n",addr,strerror(errno));
            mexErrMsgTxt("couldn't access port");
        }
        
        /*bug: if the following error out, we won't close parportfd or free addrStr -- need some exception like error handling */
        
        /* PPEXCL call succeeds, but causes following calls to fail!?!
         * then dmesg has: parport0: cannot grant exclusive access for device ppdev0
         *                 ppdev0: failed to register device!
         *
         * web search suggests this is because lp is loaded -- implications of removing it?
         */
        /*
         * result = ioctl(parportfd,PPEXCL);
         * if (result != 0) {
         * printf("ioctl PPEXCL: %d (%s)\n",result,strerror(errno));
         * mexErrMsgTxt("couldn't get exclusive access to pport");
         * }
         */
        
        result = ioctl(parportfd,PPCLAIM);
        if (result != 0) {
            printf("ioctl PPCLAIM: %d (%s)\n",result,strerror(errno));
            mexErrMsgTxt("couldn't claim pport");
        }
        
        int mode = IEEE1284_MODE_BYTE; /* or would we want COMPAT? */
        result = ioctl(parportfd,PPSETMODE,&mode);
        if (result != 0) {
            printf("ioctl PPSETMODE: %d (%s)\n",result,strerror(errno));
            mexErrMsgTxt("couldn't set byte mode");
        }
        
        result = ioctl(parportfd,PPWDATA,&b); /*PPWCONTROL(2),PPRCONTROL(2),PPRSTATUS(1),PPRDATA,PPDATADIR*/
        if (result != 0) {
            printf("ioctl PPWDATA: %d (%s)\n",result,strerror(errno));
            mexErrMsgTxt("couldn't write to pport");
        }
        
        result = ioctl(parportfd,PPRELEASE);
        if (result != 0) {
            printf("ioctl PPRELEASE: %d (%s)\n",result,strerror(errno));
            mexErrMsgTxt("couldn't release pport");
        }
        
        result = close(parportfd);
        if (result != 0) {
            printf("close: %d (%s)\n",result,strerror(errno));
            mexErrMsgTxt("couldn't close port");
        }
        
    }
    
    if (!setup) {
        if DEBUG printf("setting up access to pport\n");
        
        if USE_PPDEV {
            /**/
        } else {
            /*requires >= -O2 compiler optimization to inline inb/outb macros from io.h*/
            
            result = iopl(3); /* requires sudo, allows access to the entire address space with the associated risks.*/
            /* required for ECR. safer alternative: ioperm */
            
            if (result != 0) {
                printf("iopl: %d (%s)\n",result,strerror(errno));
                mexErrMsgTxt("couldn't claim address space");
            }
        }
        setup = true;
    }
    
    for (i = 0; i < NUM_REGISTERS; i++) {
        if (mask[i] != 0) {
            if USE_PPDEV {
                /**/
            } else {
                reg = *(uint64_T *)addr + offsets[i];
                b = inb(reg);
            }
            
            if (out == NULL) {
                if DEBUG {
                    printf("old %d:",i);
                    printBits(b);
                }
                b = (b & ~mask[i]) | vals[i]; /*frob*/
                if DEBUG {
                    printf(" -> ");
                    printBits(b);
                }
                if USE_PPDEV {
                    /**/
                } else {
                    if (offsets[i] != ECR_OFFSET && ENABLE_WRITE) outb(b,reg);
                }
                if DEBUG {
                    printf(" -> ");
                    if USE_PPDEV {
                        /**/
                    } else {
                        printBits(inb(reg));
                    }
                    printf("\n");
                }
            } else {
                for (j = 0; j < numVals; j++) {
                    if (data[j+numVals] == offsets[i]) {
                        out[i+n*NUM_REGISTERS] = getBit(b,data[j]);
                    }
                }
            }
        }
    }    
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int numAddresses, numVals, i, j, result, addrStrLen;
    
    uint64_T *addresses;
    uint8_T *data;
    mxLogical *out;
    
    uint64_T address, port;
    uint8_T bitNum, regOffset, value = 0;
    
    unsigned char mask[NUM_REGISTERS] = { 0 }, vals[NUM_REGISTERS] = { 0 }, pos;
    
    char *addrStr;
    void *addr;
    
    if (nrhs != 2) {
        mexErrMsgTxt("exactly 2 arguments required");
    }
    
    for (i = 0; i < nrhs; i++) {
        if (mxGetNumberOfDimensions(prhs[i])!=2 || mxIsComplex(prhs[i]) || !mxIsNumeric(prhs[i]) || mxGetM(prhs[i])<1) {
            mexErrMsgTxt("arguments must be real numeric matrices with at least one row");
        }
    }
    
    if (mxGetN(prhs[0])!=NUM_ADDRESS_COLS || !mxIsUint64(prhs[0])) {
        mexErrMsgTxt("first argument must be uint64 two columns (portNum, address)");
    }
    
    if (!mxIsUint8(prhs[1])) {
        mexErrMsgTxt("second argument must be uint8");
    }
    
    numAddresses = mxGetM(prhs[0]);
    addresses = mxGetData(prhs[0]);
    
    numVals = mxGetM(prhs[1]);
    data = mxGetData(prhs[1]);
    
    switch (mxGetN(prhs[1])) {
        case NUM_DATA_COLS - 1:
            if (nlhs != 1) {
                mexErrMsgTxt("exactly 1 output argument required when reading");
            }
            
            *plhs = mxCreateLogicalMatrix(numVals,numAddresses);
            if (*plhs == NULL) {
                mexErrMsgTxt("couldn't allocate output");
            }
            out = mxGetLogicals(*plhs);
            break;
        case NUM_DATA_COLS:
            if (nlhs != 0) {
                mexErrMsgTxt("exactly 0 output arguments required when writing");
            }
            out = NULL;
            break;
        default:
            mexErrMsgTxt("second argument must have 2 (reading) or 3 columns (writing): bitNum, regOffset, [value]");
            break;
    }
    
    if DEBUG printf("\n\ndata:\n");
    
    for (i = 0; i < numVals; i++) {
        bitNum    = data[i          ];
        regOffset = data[i+  numVals];
        if (out == NULL) {
            value = data[i+2*numVals];
        }
        
        if DEBUG {
            printf("\t%d, %d", bitNum, regOffset);
            if (out == NULL) printf(" %d", value);
            printf("\n");
        }
        
        if (bitNum>8 || bitNum<1 || regOffset>2 || value>1) {
            mexErrMsgTxt("bitNum must be 1-8, regOffset must be 0-2, value must be 0-1.");
        }
        
        pos = 1<<(bitNum-1);
        mask[regOffset] |= pos;
        if (value) vals[regOffset] |= pos;
    }
    
    if DEBUG {
        for (j = 0; j < NUM_REGISTERS; j++) {
            printf("mask:");
            printBits(mask[j]);
            if (out == NULL) {
                printf(" val:");
                printBits(vals[j]);
            }
            printf("\n");
        }
    }
    
    for (i = 0; i < numAddresses; i++) {
        port    = addresses[i];
        address = addresses[i+numAddresses];
        
        if DEBUG printf("addr %d: %" FMT64 "u, %" FMT64 "u\n", i, address, port);
        
        if USE_PPDEV {
            addrStrLen = strlen(ADDR_BASE) + (port == 0 ? 1 : 1 + floor(log10(port))); /* number digits in port */
            addrStr = (char *)mxMalloc(addrStrLen);
            if (addrStr == NULL) {
                mexErrMsgTxt("couldn't allocate addrStr");
            }
            
            result = snprintf(addrStr,addrStrLen+1,"%s%" FMT64 "u",ADDR_BASE,port); /* +1 for null terminator */
            if (result != addrStrLen) {
                printf("%d\t%d\t%s\n",result,addrStrLen,addrStr);
                mexErrMsgTxt("bad addrStr snprintf");
            }
            
            if DEBUG printf("%d\t%s.\n",addrStrLen,addrStr);
            
            addr = addrStr;
        } else {
            addr = &address;
        }
        
        doPort(addr, mask, vals, out, i, data, numVals);
        
        if USE_PPDEV {
            mxFree(addrStr);
        }
    }
}