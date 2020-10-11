% my P14
function f=enframe(x,win,inc)
%inc ：帧移；win：滤波窗；x：声音
nx=length(x());
nwin=length(win);
if win==1               %窗长若为1，表示没有设置窗函数
    len=win;            %帧长=窗长
else
    len=nwin;          %若不同，帧长=窗长        len 就是窗长
end
if nargin<3            %nargin 是判断输入变量的个数;
    inc=win;            %若只有两个输入量，帧移=帧长
end

nf=fix((nx-len+inc)/inc);%计算帧数
f=zeros(nf,len);           %按照矩阵进行分帧；
indf=inc*(0:(nf-1)).';    
%计算帧总位移量，是一个长度量，即inc*(0:(nf-1))
inds=(1:len);                 %
f(:)=x(indf(:,ones(1,len))+inds(ones(nf,1),:));       
          %是进行的下标量的运算
if(nwin>1)                %将分帧后的数据直接与函数窗相乘
    w=win(:)';
    f=f.*w(ones(nf,1),:);
end  
