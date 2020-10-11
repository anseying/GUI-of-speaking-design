function LSprectrum(x,wlen,inc,Pname,fs)
%该函数主要是返回语谱图的绘画
%主要是针对简单谱减法的进行总体式的绘画；
% global kk;               %提供是否已经写入相关　JBMM　基本信息
global color_val                 %显示彩色还是灰白
inc=inc*wlen;
% n=length(x);    
win=hanning(wlen);
% time=(0:n-1)/fs;
y=enframe(x,win,inc)';
fn=size(y,2);
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
w2=wlen/2+1;
n2=1:w2;
freq=(n2-1)*fs/wlen;%记录FFT的频率刻度
yy=fft(y);
imagesc(frametime,freq,abs(yy(n2,:)));
ylabel('频率/Hz'); xlabel('时间/s');
title([char(Pname),'语谱图']);
m=256;
lightyellow=[0.6 0.6 0.6];
midred=[ 0 0 0];
black=[0.5 0.7 0.1];
colors=[lightyellow;midred;black];
% disp('LSprectrum')
% color_val
% 
% if color_val==0
    SpecColorMap(m,colors);              %彩色
% elseif color_val==1
%     colormap(SpecColorMap(m,colors));        %灰白
% end

% if kk==0                 %修复了数据存入时的自动下一行的问题。   
%     fidl=fopen('JBMM.txt','r+');
%     fseek(fidl,0,'eof');
%     fprintf(fidl,'%d\r\n',max(freq));%图片宽度
%     kk=kk+1;
%     fclose(fidl);
% end
% kk