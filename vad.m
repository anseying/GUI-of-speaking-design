%MY150
%是判断的每一帧的信噪比小于零平均信噪比的点数来决定是否为有话帧，还是无话帧
%但我感觉编写的有问题，
%设置的距离比较法？   用对数频谱距离判断是否为有无话帧
function [NoiseFlag, SpeechFlag, NoiseCounter, Dist]=...
vad(signal,noise,NoiseCounter,NoiseMargin,Hangover)
                                                                          %                                        累计的无话段长度  %噪声范围      残留
                                                                          %NoiseMargin 有话段与噪声段的最小距离
if nargin<4                  %编写程序的艺术
    NoiseMargin=3;     %距离阈值             %这个阈值能否根据不同的情况进行改变。？？
end
if nargin<5                   %默认残留为八            无话段的最小长度
    Hangover=9;                %这点与最后的编写啥关系？
                                    %这里是不是可进行作为不同语音环境下的判断标准
end
if nargin<3
    NoiseCounter=0;
end 
FreqResol=length(signal);             %有问题？
SpectralDist= 20*(log10(signal)-log10(noise));% ？感觉这里存在问题，长度不一致。
  %长度一致，主要原因是‘noise’是计算的平均值
SpectralDist(find(SpectralDist<0))=0;         %没看懂。    %这里得到的是一个矩阵。
%为啥小于0的，直接给零?   只是一种标志位
Dist=mean(SpectralDist);         

% for i=1:FreqResol
%     if (Dist < NoiseMargin)              %判断有话音
%         NoiseFlag=1;                         %超过信噪比的为8个点           判断无话段
%         NoiseCounter=NoiseCounter+1;
%     else                                            %无话音
%         NoiseFlag=0;
%         NoiseCounter=0;
%     end
%     % Detect noise only periods and attenuate the signal     
%     if (NoiseCounter > Hangover)      %当判断的点数大于8时，决定存在话段
%         SpeechFlag=0;              %有无话音的判断
%     else 
%         SpeechFlag=1;                   
%     end
% end
%     
if (Dist < NoiseMargin)              %判断有话音
    NoiseFlag=1;                         %超过信噪比的为8个点           判断无话段
    NoiseCounter=NoiseCounter+1;
else                                            %无话音为1
    NoiseFlag=0;
    NoiseCounter=0;
end
% Detect noise only periods and attenuate the signal     
if (NoiseCounter > Hangover)      %当判断的点数大于8时，决定存在话段
    SpeechFlag=0;              %有无话音的判断             %为啥在低信噪比情况下
else                                     %会产生误判现象。
    SpeechFlag=1;                   %有话帧为1
end 

%[NOISEFLAG, SPEECHFLAG, NOISECOUNTER, DIST]=vad(SIGNAL,NOISE,NOISECOUNTER,NOISEMARGIN,HANGOVER)
%Spectral Distance Voice Activity Detector
%SIGNAL is the the current frames magnitude spectrum which is to labeld as
%noise or speech, NOISE is noise magnitude spectrum template (estimation),
%NOISECOUNTER is the number of imediate previous noise frames, NOISEMARGIN
%(default 3)is the spectral distance threshold. HANGOVER ( default 8 )is
%the number of noise segments after which the SPEECHFLAG is reset (goes to
%zero). NOISEFLAG is set to one if the the segment is labeld as noise
%NOISECOUNTER returns the number of previous noise segments, this value is
%reset (to zero) whenever a speech segment is detected. DIST is the
%spectral distance. 
%Saeed Vaseghi
%edited by Esfandiar Zavarehei
%Sep-04
