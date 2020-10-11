 % p203 的文件需求          噪声值最小值追踪算法
 %对其中的细节处理方 式不知道
 %测试时yi'song'li'qing的语音为准
 %%2017-05-22
function NOISE=stationary_noise_evaluate(Y,L,k)
% Y 语音信号   L 帧长     k  总帧数
%直接一个for循环完成所有的循环运算
XN=230;%是为了测试估计长度对整体的影响    %决定了m的个数
        %230是目前最优的测试值
    for b=1:L                         %帧长，全都是按照一维数据进行
            p=[0.05*abs(Y(b)).^2,zeros(1,k)];            %0.15怎么来的
            %功率
            a=0.95;                                                      %系数
                                   %感觉这里属于语音存在概率一类的值
            for d=1:k-1
                p(d+1)=a*p(d)+(1-a)*abs(Y(b+d*L)).^2;
            end                             %感觉这里很像概率估计一类的
                                                %用当前的去估计下一个，先进行
            %合并式整体计算，再进行按照每一段的语音进行
            for e=1:k-XN
%                 actmin(e)=min(e:XN+e);              %移动式的找最小值
                actmin(e)=e;                        %这里就是数据的移动，排列顺序
            end                    %这个是干啥的？      就是为了获取序号到1049
                                                              %k=1049
                                                              %     
            for l=k-XN+1:k
                m(l-(k-XN))=min(p(l:k)); %总感觉这里类似于新的全排列
            end                   %递减式的寻找最小值              %P 为1050数据
                            %  m 值为 230个
            actmin=[actmin(1:k-XN),m(1:XN)];
            %貌似在合并
            %测试一  95-> 100;
            c(1+(b-1)*k:b*k)=actmin(1:k);
            %然后再进行单个分配。
    end
    
    for t=1:k
        for j=1:L
            d(j)=c(t+(j-1)*k);
        end
        n(1+(t-1)*L:t*L)=d(1:L);
    end
    NOISE=n;