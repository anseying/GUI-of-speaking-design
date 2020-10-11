%�滭��ʱƽ��������
function SZerosP(x,wlen,inc,Pname,fs)
xx=x-mean(x);
inc=wlen*inc;
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
plot(frametime,zcr1,'b');
grid minor;title([char(Pname),'��ʱƽ��������']);
ylabel('��ֵ');xlabel(['ʱ��/s','(b)']);
