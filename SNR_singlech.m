function snr=SNR_singlech(I,In)
% ������������źŵ������
% I �Ǵ������ź�   �Ǵ�д�ġ�i��
% In �Ǵ���������ź�
% ����ȼ��㹫ʽ��
% snr=10*log10(Esignal/Enoise)         
% disp('111')                  %��������Ч��
% tic                                %������ھ����Ч����ߡ�
I=I(:)';                             % ������תΪһ��
In=In(:)';
Ps=sum((I-mean(I)).^2);              % �źŵ�����
Pn=sum((I-In).^2);                   % ����������
snr=10*log10(Ps/Pn);                 % �źŵ�����������������֮�ȣ�����ֱ�ֵ
% toc;
% wq=0;
% tic
% for i=1:length(I)
%     wq=wq+I(i)^2;
% end
% toc