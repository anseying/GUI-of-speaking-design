function snr=SNR_singlech(I,In)
% 计算带噪语音信号的信噪比
% I 是纯语音信号   是大写的‘i’
% In 是带噪的语音信号
% 信噪比计算公式是
% snr=10*log10(Esignal/Enoise)         
% disp('111')                  %测试运行效率
% tic                                %结果基于矩阵的效率最高。
I=I(:)';                             % 把数据转为一列
In=In(:)';
Ps=sum((I-mean(I)).^2);              % 信号的能量
Pn=sum((I-In).^2);                   % 噪声的能量
snr=10*log10(Ps/Pn);                 % 信号的能量与噪声的能量之比，再求分贝值
% toc;
% wq=0;
% tic
% for i=1:length(I)
%     wq=wq+I(i)^2;
% end
% toc