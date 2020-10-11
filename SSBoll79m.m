function output=SSBoll79m(signal,fs,IS,W,SP,Beta,NoiseLength,Gamma)
%myP188
% OUTPUT=SSBOLL79(S,FS,IS)
% Spectral Subtraction based on Boll 79. Amplitude spectral subtraction 
% Includes Magnitude Averaging and Residual noise Reduction
% S is the noisy signal, FS is the sampling frequency and IS is the initial
% silence (noise only) length in seconds (default value is .25 sec)
%
% April-05
% Esfandiar Zavarehei

% if (nargin<3 | isstruct(IS))                % ����������С��3����IS�ǽṹ����
%     IS=.25;                                      %seconds          ��û�� IS ��Ĭ�� .25
% end
% W=fix(.025*fs);                             % ֡��Ϊ25ms
nfft=W;                                     % ����FFT����
% SP=.4;                                      % ֡�Ʊ���ȡ40%(10ms)
wnd=hamming(W);                             % ���ô�����
% �������������ڻ����3����IS�ǽṹ����(Ϊ�˼�����������)
if (nargin>=3 & isstruct(IS))
    W=IS.windowsize
    SP=IS.shiftsize/W;
    nfft=IS.nfft;
    wnd=IS.window;
    if isfield(IS,'IS')
        IS=IS.IS;
    else
        IS=.25;
    end
end
% .......IGNORE THIS SECTION FOR CAMPATIBALITY WITH ANOTHER
%PROGRAM T0 HERE
NIS=fix((IS*fs-W)/(SP*W) +1);               % �����޻���֡��
% Gamma=1ʱΪ��ֵ�׼���,Gamma=2Ϊ�����׼���
% Gamma=2;                                               % ����Gamma

y=segment(signal,W,SP,wnd);              %��֡
Y=fft(y,nfft);
YPhase=angle(Y(1:fix(end/2)+1,:));          % ������������λ��
Y=abs(Y(1:fix(end/2)+1,:)).^Gamma;          % ȡ��Ƶ����ֵ
numberOfFrames=size(Y,2);                   % ������֡��      ��ȡ������
% FreqResol=size(Y,1);                    % ����Ƶ���е�������  ��ȡ������
                                                        %û�á�
N=mean(Y(:,1:NIS)')';                       % �����޻�������ƽ����ֵ
NRM=zeros(size(N));                         % ��ʼ��

NoiseCounter=0;
% NoiseLength=9;                              % ��������ƽ�����䳤��
% Beta=.03;                                   % ������ƽ������
YS=Y;                                       % ��������֮֡��ƽ��
for i=2:(numberOfFrames-1)           %��֡����
%     YS(:,i)=(Y(:,i-1)+Y(:,i)+Y(:,i+1))/3;     %ԭ��
    YS(:,i)=(Y(:,i-1)*0.1+Y(:,i)*0.8+Y(:,i+1)*0.1);     %����
    YS(:,i)=(Y(:,i-1)*0.375+Y(:,i)*0.25+Y(:,i+1)*0.375);     %����
end                                                    %ƽ��

for i=1:numberOfFrames         
% ȡ��һ֡�����ж��Ƿ�Ϊ�л�֡    
    [NoiseFlag, SpeechFlag, NoiseCounter, Dist]=vad(Y(:,i).^(1/Gamma),...
    N.^(1/Gamma),NoiseCounter);        %NoiseCounter����ƽ������
    %Distû�á�NoiseFlag                  ���������ķ�ֵ   �޻��εķ�ֵ    
    %����һ�����ݵ������������ж�
    if SpeechFlag==0                        % ���޻�֡��ƽ������������ֵ    Ϊ��˵���޻�
        N=(NoiseLength*N+Y(:,i))/(NoiseLength+1); %�о��������Ĳο���һֱ�ڱ䣬
                                                                                  %ÿһ��ѭ������ʹ�䷢���ı�
                  %����ƽ������*��������        %�������������Ϊ��ÿ�ζ����иı�                                                                
        NRM=max(NRM,YS(:,i)-N);    %����һ����ֵ���е�         
        % ��ȡ����������ֵ����ԭ������ YS-N ���׼���Ľ���ȫ���Ƚϣ���ȡ���ֵ
        X(:,i)=Beta*Y(:,i);                          %�������޻��Σ�ֱ��ȡСֵ
    else 
        %�жϵ��л���
        D=YS(:,i)-N;                % �׼�������   ����ÿһ�����ߵıȽ�   ֱ�ӽ����׼�
        if i>1 && i<numberOfFrames          % ���������Ĳ���ֵ
            for j=1:length(D)                           %ÿһ֡�ڵ����ߴ���
                if D(j)<NRM(j)
                    D(j)=min([D(j) YS(j,i-1)-N(j) YS(j,i+1)-N(j)]);     %ƽ��
                end                                                                        %ȡ���ߵ���Сֵ
            end
        end
        X(:,i)=max(D,0);                    % ÿ�����߷�ֵ������0     ��Ϊ��������бȽϣ�
        %�ڽ���ƽ��ʱD���� ��ֵ 
    end                                            %ֻ�õ����� 0 ����ֵ������ֱ�ӵľ���ת��
    
end
output=OverlapAdd2(X.^(1/Gamma),YPhase,W,SP*W);
% ������Ƶ�׷�ֵ����λ�Ǻϳ�����
