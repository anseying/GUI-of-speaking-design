% my P14
function f=enframe(x,win,inc)
%inc ��֡�ƣ�win���˲�����x������
nx=length(x());
nwin=length(win);
if win==1               %������Ϊ1����ʾû�����ô�����
    len=win;            %֡��=����
else
    len=nwin;          %����ͬ��֡��=����        len ���Ǵ���
end
if nargin<3            %nargin ���ж���������ĸ���;
    inc=win;            %��ֻ��������������֡��=֡��
end

nf=fix((nx-len+inc)/inc);%����֡��
f=zeros(nf,len);           %���վ�����з�֡��
indf=inc*(0:(nf-1)).';    
%����֡��λ��������һ������������inc*(0:(nf-1))
inds=(1:len);                 %
f(:)=x(indf(:,ones(1,len))+inds(ones(nf,1),:));       
          %�ǽ��е��±���������
if(nwin>1)                %����֡�������ֱ���뺯�������
    w=win(:)';
    f=f.*w(ones(nf,1),:);
end  
