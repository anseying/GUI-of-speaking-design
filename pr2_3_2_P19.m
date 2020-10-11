%my18           ��ʱƽ��������
clear all;
[x,fs]=wavread('sl.wav');
xx=x-mean(x);
wlen=200;inc=80;
win=hanning(wlen);
n=length(x);
sframe=enframe(x,win,inc)';
fn=size(sframe,2);
zcr1=zeros(1,fn);
for i=1:fn
    z=sframe(:,i);
    for j=1:wlen-1
        if z(j)*z(j+1)<0
            zcr1(i)=zcr1(i)+1;
        end
    end
end
time=(0:n-1)/fs;
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
subplot(211);plot(time,x);grid minor;
title('��������');
ylabel('��ֵ');xlabel(['ʱ��/s','(a)']);

subplot(212);plot(frametime,zcr1,'k');
grid minor;title('��ʱƽ��������');
ylabel('��ֵ');xlabel(['ʱ��/s','(b)']);


