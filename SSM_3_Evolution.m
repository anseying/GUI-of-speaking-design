%MY 183
%�Լ��������в��м���
%
%2�����ֵ����⣬���������ִ������Ӳ���
%�����м���ģʽû�¡�  ʧ��.
clear all;
tic
load ecg_m.mat;
s=x;
N=length(x); fs=1000;  n=1:N;
n2=1:N/2;    tt=(n-1)/fs;
ff=(n2-1)*fs/N;
X=fft(x);
%��ɲ��м���ģʽ����Խ�Լ��ʱ��
    f0=50:100:450;
     f0=f0';
    x1(1:5,:)=cos(f0.*2*pi*tt);
    x2(1:5,:)=sin(f0.*2*pi*tt);
    w1=0;w2=1;
    e=zeros(1,N);
    y=zeros(1,N);
    mu=0.1;
for i=1:N                                        %����ط����㲻ͨ����
    y(i)=sum(x1(:,i).*w1+x2(:,i).*w2);
    e(i)=x(i)-y(i);
    w1=w1+x1(i).*mu*e(i);
    w2=w2+x2(i).*mu*e(i);
end

output=e;

figure(1);
subplot 211;plot(tt,s,'b');
title('�ĵ�ͼԭʼ����');xlabel('ʱ��/s');ylabel('��ֵ');
% axis([0 10 -3000 6500]);
X=X/max(abs(x));
subplot 212;plot(ff,abs(X(n2)),'b');
axis tight;title('�ĵ�ͼ�׷���');
xlabel('Ƶ��/Hz');ylabel('��ֵ');
figure(2);
% pos=get(gcf,'Position');
% set(gcf,'position',[pos(1),pos(2)-100,pos(3),pos(4)-200]);

subplot 211;
plot(tt,output,'b');
axis([0 10 -3000 6500]);
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
