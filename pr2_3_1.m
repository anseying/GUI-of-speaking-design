%my17    ˼ά���÷�֡��˼ά���õ����Եķ�֡��ȡÿһ���
%���������������޳���ʱ�����н��з�Ƭ����
%��enframe.m�������
% filedir=[];         %������
% filename=[];        %������
% file=[filedir filename];
%��������źŵ�ʱ�����������ʣ�����ÿһ֡���������
clear all;
[x,fs]=wavread('qq3.wav');
wlen=400;inc=80;            %֡����֡��
win=hanning(wlen);          %������
n=length(x);
xx=enframe(x,win,inc)';     %��֡
fn=size(xx,2);                      %��ȡ֡��
time=(0:n-1)/fs;                    %�����źŵ�ʱ������
for i=1:fn
    u=xx(:,i);                          %�д������
    u2=u.*u;                         %ÿһ֡�����ݽ���ƽ�����
    en(i)=sum(u2);             %�ٶ�ÿһ֡���������
end
% figure(2);
subplot(311);
plot(time,x,'b');grid minor;
title('��������');
ylabel('��ֵ');xlabel(['ʱ��/s','(a)']);

% frametime=frame2time(fn,wlen,inc,fs);
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
subplot(312);
plot(frametime,en,'k');
title('��ʱ����');grid minor;
ylabel('��ֵ');
xlabel(['ʱ��/s','(b)']);

% for i=1:n
%     mi(i)=sum(abs(x(1:i)));
% end
subplot(313);         %
plot(time,abs(x));grid minor;
% plot(time,mi,'b');grid minor;
title('����ƽ���������');
ylabel('��ֵ');xlabel(['ʱ��/s','(a)']);


