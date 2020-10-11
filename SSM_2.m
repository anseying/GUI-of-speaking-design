%�ͣ٣�����
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
wavplay(signal,fs);                          % �����������Ƚ�
pause(1)
wavplay(output,fs);
% ��ͼ
subplot 311; plot(time,x,'k'); grid;axis tight;
title('ԭʼ�����ź�');ylabel('��ֵ');

subplot 312; plot(time,signal,'k'); grid;axis tight;
title(['�������� �����=' num2str(SNR) 'dB']);ylabel('��ֵ');

subplot 313; plot(time,output,'k'); grid;
title('�׼�����');ylabel('��ֵ');
xlabel('ʱ��/s')