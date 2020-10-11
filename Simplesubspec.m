function output=Simplesubspec(signal,wlen,inc,NIS,a,b)
%����MY185���׼���ȥ��򵥰�
%ֱ��ժ¼��Դ�����Լ���Ҫ��һ����������
%NIS��ǰ���޻���֡����   a����������   b�����油������
wnd=hanning(wlen);
N=length(signal);

y=enframe(signal,wnd,inc)';
fn=size(y,2);

y_fft=fft(y);
y_phase=angle(y_fft);
y_abs=abs(y_fft);                %��ȡ��ֵ

y_E=y_abs.^2;                     %������
Nt=mean(y_abs(:,1:NIS),2);%����������ƽ������
nl2=wlen/2+1;
for i=1:fn
    for k=1:nl2
            if y_abs(k,i)>a*Nt(k)           %���������������������
                temp(k)=y_abs(k,i)-a*Nt(k);
            else
                temp(k)=b*y_abs(k,i);   %���û����������������зŴ�           
            end
            U(k)=sqrt(temp(k));            %��¼�ķ�ֵ����
    end
    X(:,i)=U;
end
output=OverlapAdd2(X,y_phase(1:nl2,:),wlen,inc);

Nout=length(output);          %�׼�������ݳ��Ȳ���������ȳ�
if Nout>N
    output=output(1:N);
elseif Nout<N
    output=[output;zeros(N-Nout,1)];
end
output=output/max(abs(output));


