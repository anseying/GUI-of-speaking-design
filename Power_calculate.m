%���������ڶ������ļ��㣬��ȥ�鿴����������Ӱ�죻

function  Power_calculate(wlen,inc)
string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
Pname={'ԭʼ����';'��������';'��ǿ����'};
global fs
for j=1:3                       %��ȡ�����ļ�
    voice(j,:)=wav_read(string_name(j));
%     voice(j,:)=voice(j,:)/max(abs(voice(j,:)));
end
figure(5);
N=length(voice(1,:));
win=hanning(wlen);
time=(0:N-1)/fs;
X=enframe(voice(1,:),win,inc)';
fn=size(X,2);            %��ȡ֡��
% size(X)
% length(time)
% length(voice(1,:))
% length(voice(3,:))
for i=1:3
    subplot(3,1,i);
    hold on;
    X=enframe(voice(i,:),win,inc)';
    for j=1:fn
        u=X(:,j);
        u2=u.*u;
        En(j)=sum(u2);
    end
    frameTime=frame2time(fn,wlen,inc,fs);
    plot(time,voice(i,:)+2,'b');    grid on;
    plot(frameTime,En./max(En)*3,'r');
    title(([char(Pname(i)),' ʱ��ͼ���ʱ����']));
    ylabel('��ֵ'); xlabel('ʱ��/s');
    ylim([0 3]);hold off;
    grid minor;
end
