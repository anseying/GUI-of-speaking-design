%my=25
clear all;
[x,fs]=wavread('bluesky1.wav');
wlen=400;inc=80;win=hanning(wlen);
n=length(x);
time=(0:n-1)/fs;
y=enframe(x,win,inc)';
fn=size(y,2);
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
w2=wlen/2+1;
n2=1:w2;
freq=(n2-1)*fs/wlen;
yy=fft(y);
figure(1)
% clf;
set(gcf,'position',[20 100 600 500]);
axes('position',[0.1 0.1 0.85 .5]);
imagesc(frametime,freq,abs(yy(n2,:)));
axis xy; ylabel('频率/Hz'); xlabel('时间/s');
title('语谱图');
m=64;
lightyellow=[0.6 0.6 0.6];
midred=[ 0 0 0];
black=[0.5 0.7 0.1];
colors=[lightyellow;midred;black];
SpecColorMap(m,colors)
% colormap(SpecColorMap(m,colors));

%对时域图进行绘画
axes('position',[0.07 0.72 0.9 0.22]);
plot(time,x,'k');
xlim([0 max(time)]);
xlabel('时间/s');ylabel('幅值');
title('语音信号波形');


