
[wav,fs,nbits]=wavread('bluesky3.wav');
nwind=240;noverlap=160;inc=nwind-noverlap;
w_nwind=hanning(200);w_noverlap=195;
nfft=200;

[pxx]=pwelch_2(wav,nwind,noverlap,w_nwind,w_noverlap,nfft);
framenum=size(pxx,2);
frametime=frame2time(framenum,nfft,inc,fs);
freq=(0:nfft/2)*fs/nfft;
figure(1);
imagesc(frametime,freq,pxx);axis xy;
ylabel('频率/Hz');
xlabel('时间/s');
title('短时功率谱密度函数');
m=256;lightyellow=[0.6 0.6 0.6];
midred=[0 0 0];black=[0.5 0.71 1];
 colors=[lightyellow;midred;black];
 colormap(SpecColorMap(m,colors));
 
