%my24   2017-03-20

function d=stftms(x,win,nfft,inc)
if length(win)==1
    wlen=win;
    win=hanning(wlen);
else
    wlen=length(win);
end
x=x(:);win=win(:);
s=length(x);

c=1;
d=zeros((1+nfft/2),1+fix((s-wlen)/inc));
for b=0:inc:(s-wlen)
    u=win.*x((b+1):(b+wlen));
    t=fft(u,nfft);
    d(:,c)=t(1:(1+nfft/2));
    c=c+1;
end