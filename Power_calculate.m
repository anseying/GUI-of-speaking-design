%本函数用于对能量的计算，想去查看最后对能量的影响；

function  Power_calculate(wlen,inc)
string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
Pname={'原始语音';'含噪语音';'增强语音'};
global fs
for j=1:3                       %读取声音文件
    voice(j,:)=wav_read(string_name(j));
%     voice(j,:)=voice(j,:)/max(abs(voice(j,:)));
end
figure(5);
N=length(voice(1,:));
win=hanning(wlen);
time=(0:N-1)/fs;
X=enframe(voice(1,:),win,inc)';
fn=size(X,2);            %获取帧数
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
    title(([char(Pname(i)),' 时域图与短时能量']));
    ylabel('幅值'); xlabel('时间/s');
    ylim([0 3]);hold off;
    grid minor;
end
