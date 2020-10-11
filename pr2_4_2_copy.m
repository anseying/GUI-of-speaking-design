%
% pr2_4_2 
% clear all; clc; close all;

% filedir=[];                                    % 设置路径
% filename='bluesky3.wav';                       % 设置文件名
% fle=[filedir filename];                        % 构成完整的路径和文件名
[wavin0,fs,nbits]=wavread('qq3.wav');                % 读入数据文件
nwind=240; noverlap=160; inc=nwind-noverlap;   % 设置帧长为240，重叠为160，帧移为80
w_nwind=hanning(200); w_noverlap=195;          % 设置段长为200，段重叠为195
nfft=200;                                      % FFT长度为200
% 对每帧用pwelch_2计算短时功率谱密度
[Pxx] = pwelch_2(wavin0, nwind, noverlap, w_nwind, w_noverlap, nfft);
frameNum=size(Pxx,2);                          % 取来帧数
frameTime=frame2time(frameNum,nfft,inc,fs);    % 计算每帧对应的时间
freq=(0:nfft/2)*fs/nfft;                       % 计算频率刻度
% 作图
figure(2);
imagesc(frameTime,freq,Pxx); axis xy           
ylabel('频率/Hz');
xlabel('时间/s');
title('短时功率谱密度函数')
m = 256; LightYellow = [0.6 0.6 0.6];
MidRed = [0 0 0]; Black = [0.5 0.7 1];
Colors = [LightYellow; MidRed; Black];
colormap(SpecColorMap(m,Colors));




clear all;
y=load('su1.txt');
fs=16000;nfft=1024;
time=(0:nfft-1)/fs;
figure(1);
subplot(211);plot(time,y,'k');
title('信号波形');axis([0 max(time) -0.7 0.7]);
ylabel('幅值');xlabel(['时间/s'  10 '(a)']); grid;
figure(2);
nn=1:nfft/2;ff=(nn-1)*fs/nfft;
Y=log(abs(fft(y)));
subplot 211;plot(ff,Y(nn),'k');hold on;
z=ifft(Y);
figure(1);subplot 212;plot(time,z,'k');
title('信号倒谱图');axis([0 time(512) -0.2 0.2]);grid;
ylabel('幅值');xlabel(['倒频率/s' 10 '(b)']);
mcep=29;
zy=z(1:mcep+1);