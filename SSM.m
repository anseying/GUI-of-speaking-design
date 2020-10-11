%实现谱减法的原理
%SSM=spectral subtration method 谱减法   LMS方法
% pr7_1_2      MY182
clear all; 

% filedir=[];                             % 指定文件路径
% filename='bluesky1.wav';                % 指定文件名
% fle=[filedir filename]                  % 构成路径和文件名的字符串
[s,fs]=wavread('bluesky1.wav');                    % 读入数据文件
s=s/max(abs(s));                        % 幅值归一化
N=length(s);                            % 求出信号长度
time=(0:N-1)/fs;                        % 设置时间
ns=0.5*cos(2*pi*500*time);               % 计算出50Hz工频信号
x=s+ns';                                % 语音信号和50Hz工频信号叠加
snr1=SNR_singlech(s,x);                 % 计算叠加50Hz工频信号后的信噪比

x1=cos(2*pi*500*time);                   % 设置x1和x2
x2=sin(2*pi*500*time);
w1=0.1;                                 % 初始化w1和w2
w2=0.1;
e=zeros(1, N);                          % 初始化e和y
y=zeros(1, N);
mu=0.02;                                % 设置mu
for i=1: N                              % LMS自适应陷波器滤波         自适应陷波器？？？？？？
  y(i)=w1 * x1(i)+ w2 * x2(i);          % 按式(7-1-29)计算y           MYP181
  e(i) =x(i)-y(i);                      % 按式(7-1-30)计算e
  w1=w1+mu * e(i) * x1(i);              % 按式(7-1-31)调整w
  w2=w2+mu * e(i) * x2(i);
end
output=e';                              % 陷波器输出
snr2=SNR_singlech(s,output);            % 计算滤波后的信噪比 
snr=snr2-snr1;
fprintf('snr1=%5.4f   snr2=%5.4f    snr=%5.4f\n',snr1,snr2,snr);
% sound(x,fs);%wavplay(x,fs);                          % 从声卡发声比较
% pause(4)
% sound(output,fs);%wavplay(output,fs);
% % 作图
% subplot 311; plot(time,s,'k'); 
% ylim([-1 1 ]); title('原始语音信号');
% subplot 312; plot(time,x,'k'); 
% ylim([-1 1 ]); title('带噪语音信号');
% subplot 313; plot(time,output,'k'); 
% ylim([-1 1 ]); title('LMS滤波输出语音信号');
% xlabel('时间/s')
% 
% figure(2);
% title('滤波波形与原始语音做差图');
% plot(time,(s-output),'r');
figure(3)
subplot 311
plot(time,s,'y',time,(s-output),'r');
subplot(312);
plot(time,s,'y',time,(output),'r');
subplot 313;
plot(time,output,'r',time,s,'y');

