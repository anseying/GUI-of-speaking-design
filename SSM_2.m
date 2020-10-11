%ＭＹ１８７
clear all;
[xx,fs]=wavread('bluesky1.wav');
xx=xx-mean(xx);
x=xx/max(abs(xx));

IS=0.25;
wlen=200;
inc=80;
SNR=5;
N=length(xx);
time=(0:N-1)/fs;
signal=Gnoisegen(x,SNR);
snr1=SNR_singlech(x,signal);
overlap=wlen-inc;
NIS=fix((IS*fs-wlen)/inc+1);

a=4;b=0.001;
output=Simplesubspec(signal,wlen,inc,NIS,a,b);
snr2=SNR_singlech(x,output);
snr=snr2-snr1;
fprintf('snr1=%5.4f   snr2=%5.4f    snr=%5.4f\n',snr1,snr2,snr);
wavplay(signal,fs);                          % 从声卡发声比较
pause(1)
wavplay(output,fs);
% 作图
subplot 311; plot(time,x,'k'); grid;axis tight;
title('原始语音信号');ylabel('幅值');

subplot 312; plot(time,signal,'k'); grid;axis tight;
title(['带噪语音 信噪比=' num2str(SNR) 'dB']);ylabel('幅值');

subplot 313; plot(time,output,'k'); grid;
title('谱减后波形');ylabel('幅值');
xlabel('时间/s')