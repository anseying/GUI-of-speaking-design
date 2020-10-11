%MY 183
%�Ľ����׼�����
%����1�����׼���ʹ���źŵ�Ƶ�׷�ֵ������
%2��
clear all;
tic
load ecg_m.mat;
s=x;
N=length(x);
fs=1000;  n=1:N;
n2=1:N/2;
tt=(n-1)/fs;
ff=(n2-1)*fs/N;
X=fft(x);
for k=1:5
     j=(k-1)*2+1;
    f0=50*j;
    x1=cos(2*pi*tt*f0);
    x2=sin(2*pi*tt*f0);
    w1=0;
    w2=1;
    e=zeros(1,N);
    y=zeros(1,N);
    mu=0.1;
    for i=1:N
        y(i)=w1*x1(i)+w2*x2(i);
        e(i)=x(i)-y(i);
        w1=w1+mu*e(i)*x1(i);
        w2=w2+mu*e(i)*x2(i);
    end
     x=e;
end
output=e;
figure(1);
subplot 211;plot(tt,s,'b');
title('�ĵ�ͼԭʼ����');xlabel('ʱ��/s');ylabel('��ֵ');
axis([0 10 -3000 6500]);
X=X/max(abs(X));
subplot 212;plot(ff,abs(X(n2)),'b');
axis tight;title('�ĵ�ͼ�׷���');
xlabel('Ƶ��/Hz');ylabel('��ֵ');

figure(2);
subplot 211;
pos=get(gcf,'Position');
% set(gcf,'position',[pos(1),pos(2)-100,pos(3),pos(4)-200]);
plot(tt,output,'b');
axis([0 10 -2000 6500]);
title('����Ӧ�ݲ����˲�����ĵ�ͼ');
xlabel('ʱ��/s');ylabel('��ֵ');
F_output=fft(output);
X=F_output/max(abs(F_output));
subplot 212;plot(ff,abs(X(n2)),'b');
title('�ݲ����˲�����');
xlabel('ʱ��/s');ylabel('��ֵ');

toc
%��ʱ���0.5038s     ��443508
%��ʼ����0.647742s

