function out = polarMap(in);
in(isnan(in))=0;
ph =angle(in);
ph(ph<0) = ph(ph<0)+2*pi;
ph=mat2im(ph,hsv,[0 2*pi]);
amp = abs(in);
amp = amp/prctile(amp(:),90);

out = ph.* repmat(amp,[1 1 3]);
