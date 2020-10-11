%MY 203
%熵比法进行基音检测端点函数       
%语音端点的检测是包含语音的一段信号中确定的起始点与结束点的位置     MY117
%处理没有噪声的语音端点检测，用短时平均能量可以检测出语音的端点；
%低信噪比情况下的端点检测
function [voiceseg,vosl,SF,Ef]=pitch_vad1(y,fn,T1,miniL)
%SF 判断是否为有话帧   SF=1 , fn 为总帧数
if nargin<4, miniL=10; end
%minil 有话段的最小帧数
if size(y,2)~=fn, y=y'; end                   % 把y转换为每列数据表示一帧语音信号

wlen=size(y,1);                               % 取得帧长
for i=1:fn
    Sp = abs(fft(y(:,i)));                          % FFT取幅值
    Sp = Sp(1:wlen/2+1);	                  % 只取正频率部分
    Esum(i) = sum(Sp.*Sp);                    % 计算能量值
    prob = Sp/(sum(Sp));	                    % 计算概率
    H(i) = -sum(prob.*log(prob+eps));         % 求谱熵值
end

hindex=find(H<0.1);                              %返回坐标量
H(hindex)=max(H);
Ef=sqrt(1 + abs(Esum./H));                    % 计算能熵比

Ef=Ef/max(Ef);                                        % 归一化

%决定长度问题，直接比较‘T1’参量来确定长度
zindex=find(Ef>=T1);                          % 寻找Ef中大于T1的部分

zseg=findSegment(zindex);                     % 给出端点检测各段的信息
%总感觉 findSegment 函数存在问题
zsl=length(zseg);                             % 给出段数
j=0;
SF=zeros(1,fn);
for k=1 : zsl                                 % 在大于T1中剔除小于miniL的部分
    if zseg(k).duration>=miniL
        j=j+1;
        in1=zseg(k).begin;
        in2=zseg(k).end;
        
        voiceseg(j).begin=in1;
        voiceseg(j).end=in2;
        
        voiceseg(j).duration=zseg(k).duration;
        SF(in1:in2)=1;                        % 设置SF    之所以能够剔除短时间的片段，是直接
                                                        %通过SF片段的长度来进行，
    end
end
vosl=length(voiceseg);                        % 有话段的段数 





