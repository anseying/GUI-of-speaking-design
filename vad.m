%MY150
%���жϵ�ÿһ֡�������С����ƽ������ȵĵ����������Ƿ�Ϊ�л�֡�������޻�֡
%���Ҹо���д�������⣬
%���õľ���ȽϷ���   �ö���Ƶ�׾����ж��Ƿ�Ϊ���޻�֡
function [NoiseFlag, SpeechFlag, NoiseCounter, Dist]=...
vad(signal,noise,NoiseCounter,NoiseMargin,Hangover)
                                                                          %                                        �ۼƵ��޻��γ���  %������Χ      ����
                                                                          %NoiseMargin �л����������ε���С����
if nargin<4                  %��д���������
    NoiseMargin=3;     %������ֵ             %�����ֵ�ܷ���ݲ�ͬ��������иı䡣����
end
if nargin<5                   %Ĭ�ϲ���Ϊ��            �޻��ε���С����
    Hangover=9;                %��������ı�дɶ��ϵ��
                                    %�����ǲ��ǿɽ�����Ϊ��ͬ���������µ��жϱ�׼
end
if nargin<3
    NoiseCounter=0;
end 
FreqResol=length(signal);             %�����⣿
SpectralDist= 20*(log10(signal)-log10(noise));% ���о�����������⣬���Ȳ�һ�¡�
  %����һ�£���Ҫԭ���ǡ�noise���Ǽ����ƽ��ֵ
SpectralDist(find(SpectralDist<0))=0;         %û������    %����õ�����һ������
%ΪɶС��0�ģ�ֱ�Ӹ���?   ֻ��һ�ֱ�־λ
Dist=mean(SpectralDist);         

% for i=1:FreqResol
%     if (Dist < NoiseMargin)              %�ж��л���
%         NoiseFlag=1;                         %��������ȵ�Ϊ8����           �ж��޻���
%         NoiseCounter=NoiseCounter+1;
%     else                                            %�޻���
%         NoiseFlag=0;
%         NoiseCounter=0;
%     end
%     % Detect noise only periods and attenuate the signal     
%     if (NoiseCounter > Hangover)      %���жϵĵ�������8ʱ���������ڻ���
%         SpeechFlag=0;              %���޻������ж�
%     else 
%         SpeechFlag=1;                   
%     end
% end
%     
if (Dist < NoiseMargin)              %�ж��л���
    NoiseFlag=1;                         %��������ȵ�Ϊ8����           �ж��޻���
    NoiseCounter=NoiseCounter+1;
else                                            %�޻���Ϊ1
    NoiseFlag=0;
    NoiseCounter=0;
end
% Detect noise only periods and attenuate the signal     
if (NoiseCounter > Hangover)      %���жϵĵ�������8ʱ���������ڻ���
    SpeechFlag=0;              %���޻������ж�             %Ϊɶ�ڵ�����������
else                                     %�������������
    SpeechFlag=1;                   %�л�֡Ϊ1
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
