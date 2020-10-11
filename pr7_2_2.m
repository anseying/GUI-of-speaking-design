%ֱ�۸о���ϵ���������⣬��Щʧ��
% pr7_2_2 
% clear all; 
% clc; close all;
% 
% filedir=[];                             % ָ���ļ�·��
% filename='bluesky1.wav';                % ָ���ļ���
% fle=[filedir filename]                  % ����·�����ļ������ַ���
[xx,fs]=wavread('bluesky1.wav');                   % ���������ļ�
xx=xx-mean(xx);                         % ����ֱ������
x=xx/max(abs(xx));                     % ��x�� ��ֵ��һ��
SNR=10;                                    % ���������
signal=Gnoisegen(x,SNR);                 % ��signal����������
snr1=SNR_singlech(x,signal);            % �������������������
N=length(x);                            % �źų���
time=(0:N-1)/fs;                      % ����ʱ��̶�
IS=.15;                                   % ����IS

output=SSBoll79m(signal,fs,IS);          % ����SSBoll79�������׼�
ol=length(output);                      % ��output������x�ȳ�
if ol<N
    output=[output; zeros(N-ol,1)];
end
snr2=SNR_singlech(x,output);            % �����׼���������
snr=snr2-snr1;
fprintf('snr1=%5.4f   snr2=%5.4f   snr=%5.4f\n',snr1,snr2,snr);

% wavplay(signal,fs);
sound(signal,fs);
pause(3)
sound(output,fs);
% ��ͼ
subplot 311; plot(time,x,'k'); grid; axis tight;
title('����������'); ylabel('��ֵ')
subplot 312; plot(time,signal,'k'); grid; axis tight;
title(['�������� �����=' num2str(SNR) 'dB']); ylabel('��ֵ')
subplot 313; plot(time,output,'k');grid; ylim([-1 1]);
title('�׼�����'); ylabel('��ֵ'); xlabel('ʱ��/s');

