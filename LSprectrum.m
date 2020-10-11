function LSprectrum(x,wlen,inc,Pname,fs)
%�ú�����Ҫ�Ƿ�������ͼ�Ļ滭
%��Ҫ����Լ��׼����Ľ�������ʽ�Ļ滭��
% global kk;               %�ṩ�Ƿ��Ѿ�д����ء�JBMM��������Ϣ
global color_val                 %��ʾ��ɫ���ǻҰ�
inc=inc*wlen;
% n=length(x);    
win=hanning(wlen);
% time=(0:n-1)/fs;
y=enframe(x,win,inc)';
fn=size(y,2);
frametime=(((1:fn)-1)*inc+wlen/2)/fs;
w2=wlen/2+1;
n2=1:w2;
freq=(n2-1)*fs/wlen;%��¼FFT��Ƶ�ʿ̶�
yy=fft(y);
imagesc(frametime,freq,abs(yy(n2,:)));
ylabel('Ƶ��/Hz'); xlabel('ʱ��/s');
title([char(Pname),'����ͼ']);
m=256;
lightyellow=[0.6 0.6 0.6];
midred=[ 0 0 0];
black=[0.5 0.7 0.1];
colors=[lightyellow;midred;black];
% disp('LSprectrum')
% color_val
% 
% if color_val==0
    SpecColorMap(m,colors);              %��ɫ
% elseif color_val==1
%     colormap(SpecColorMap(m,colors));        %�Ұ�
% end

% if kk==0                 %�޸������ݴ���ʱ���Զ���һ�е����⡣   
%     fidl=fopen('JBMM.txt','r+');
%     fseek(fidl,0,'eof');
%     fprintf(fidl,'%d\r\n',max(freq));%ͼƬ���
%     kk=kk+1;
%     fclose(fidl);
% end
% kk