%my17    思维利用分帧的思维，用叠加性的分帧求取每一块的
%能量，将看似无限长的时间序列进行分片处理
%与enframe.m；相关联
% filedir=[];         %待补充
% filename=[];        %待补充
% file=[filedir filename];
%计算关于信号的时间能量；疑问：对于每一帧的能量求和
clear all;
[x,fs]=wavread('qq3.wav');
wlen=400;inc=80;            %帧长、帧移
win=hanning(wlen);          %海宁窗
n=length(x);
xx=enframe(x,win,inc)';     %分帧
fn=size(xx,2);                      %求取帧数
time=(0:n-1)/fs;                    %计算信号的时间坐标
for i=1:fn
    u=xx(:,i);                          %列处理对象
    u2=u.*u;                         %每一帧的数据进行平方相乘
    en(i)=sum(u2);             %再对每一帧的能量相加
end
% figure(2);
subplot(311);
plot(time,x,'b');grid minor;
title('语音波形');
ylabel('幅值');xlabel(['时间/s','(a)']);

% frametime=frame2time(fn,wlen,inc,fs);
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
subplot(312);
plot(frametime,en,'k');
title('短时能量');grid minor;
ylabel('幅值');
xlabel(['时间/s','(b)']);

% for i=1:n
%     mi(i)=sum(abs(x(1:i)));
% end
subplot(313);         %
plot(time,abs(x));grid minor;
% plot(time,mi,'b');grid minor;
title('语音平均振幅波形');
ylabel('幅值');xlabel(['时间/s','(a)']);


