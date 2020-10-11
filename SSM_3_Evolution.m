%MY 183
%自己想对其进行并行计算
%
%2、出现的问题，计算过后出现大量的杂波？
%而串行计算模式没事。  失败.
clear all;
tic
load ecg_m.mat;
s=x;
N=length(x); fs=1000;  n=1:N;
n2=1:N/2;    tt=(n-1)/fs;
ff=(n2-1)*fs/N;
X=fft(x);
%变成并行计算模式，相对节约了时间
    f0=50:100:450;
     f0=f0';
    x1(1:5,:)=cos(f0.*2*pi*tt);
    x2(1:5,:)=sin(f0.*2*pi*tt);
    w1=0;w2=1;
    e=zeros(1,N);
    y=zeros(1,N);
    mu=0.1;
for i=1:N                                        %这个地方计算不通过；
    y(i)=sum(x1(:,i).*w1+x2(:,i).*w2);
    e(i)=x(i)-y(i);
    w1=w1+x1(i).*mu*e(i);
    w2=w2+x2(i).*mu*e(i);
end

output=e;

figure(1);
subplot 211;plot(tt,s,'b');
title('心电图原始数据');xlabel('时间/s');ylabel('幅值');
% axis([0 10 -3000 6500]);
X=X/max(abs(x));
subplot 212;plot(ff,abs(X(n2)),'b');
axis tight;title('心电图谱分析');
xlabel('频率/Hz');ylabel('幅值');
figure(2);
% pos=get(gcf,'Position');
% set(gcf,'position',[pos(1),pos(2)-100,pos(3),pos(4)-200]);

subplot 211;
plot(tt,output,'b');
axis([0 10 -3000 6500]);
title('自适应陷波器滤波后的心电图');
xlabel('时间/s');ylabel('幅值');
F_output=fft(output);
X=F_output/max(abs(F_output));
subplot 212;plot(ff,abs(X(n2)),'b');
title('陷波器滤波后波形');
xlabel('时间/s');ylabel('幅值');
toc
%用时最短0.5038s     。443508
%初始运行0.647742s
