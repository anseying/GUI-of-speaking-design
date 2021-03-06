function xn=Jnum(PD)
%该函数用来判断输入的数据是否为   一维   实数   数字
xn=(ndims(PD) < 2) | (max(size(PD)) == 1) | ~isreal(PD) | ~isnumeric(PD);


%%%  改进方向
%%% ======         匹配带有固定小数或固定长的数据
% b=132465;
% regexp(b,'[(^[0-9]{1}+[.]+[0-9]{0,4}+$ )| (^[0-9]+$)]','once')

%在短时谱语音平台下，如何进行判断等级的提升，如对语音谱帧长的处理
%对于不同格式的数据进行判断
%感觉自己又想放弃了，不想进行论文发表，自己的实力不够。

%感觉下一步可以将整个图片展示的部分进行全部集合在一起
%做出一个平台，对任何图片均可调用。真正的做到通用化，而不是
%专门化。