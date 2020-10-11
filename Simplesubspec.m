function output=Simplesubspec(signal,wlen,inc,NIS,a,b)
%来自MY185的谱减法去噪简单版
%直接摘录的源程序，自己需要进一步进行完善
%NIS：前导无话段帧数，   a：过减因子   b：增益补偿因子
wnd=hanning(wlen);
N=length(signal);

y=enframe(signal,wnd,inc)';
fn=size(y,2);

y_fft=fft(y);
y_phase=angle(y_fft);
y_abs=abs(y_fft);                %求取幅值

y_E=y_abs.^2;                     %求能量
Nt=mean(y_abs(:,1:NIS),2);%计算噪声段平均能量
nl2=wlen/2+1;
for i=1:fn
    for k=1:nl2
            if y_abs(k,i)>a*Nt(k)           %如果比噪声大，则进行相减，
                temp(k)=y_abs(k,i)-a*Nt(k);
            else
                temp(k)=b*y_abs(k,i);   %如果没有噪声则对声音进行放大           
            end
            U(k)=sqrt(temp(k));            %记录的幅值开方
    end
    X(:,i)=U;
end
output=OverlapAdd2(X,y_phase(1:nl2,:),wlen,inc);

Nout=length(output);          %谱减后的数据长度补足与输入等长
if Nout>N
    output=output(1:N);
elseif Nout<N
    output=[output;zeros(N-Nout,1)];
end
output=output/max(abs(output));


