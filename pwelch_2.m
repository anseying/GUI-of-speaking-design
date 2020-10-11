%短时功率谱密度函数

function [pxx]=pwelch_2(x,nwind,noverlap,w_nwind,w_noverlap,nfft)
x=x(:);
inc=nwind-noverlap;
xx=enframe(x,nwind,inc)';
framenum=size(x,2);

for k=1:framenum
    pxx(:,k)=pwelch(x(:,k),w_nwind,w_noverlap,nfft);
end