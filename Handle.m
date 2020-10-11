

% t=-pi:0.01:pi;
% plotSin(@sin,t)

% plotSin2=@(x)plot(x,sin(x));

% % 创建匿名函数，并返回函数句柄
% %匿名函数：特殊构造，没有函数名，只有句柄
% %使编写简洁，执行效率高；

% t=-pi:0.01:pi;
% plotSin(t);

% 函数句柄是将函数的“变量化”，函数的句柄可以批量执行
%    arrayfun
% fun{1}=rand(3,6);
% fun{2}=magic(12);
% fun{3}=ones(5,10);
% counts=arrayfun(@(x) numel(x{:}),fun)      %统计每个函数的个数

fun{1}=@()rand(1,10^6);
fun{2}=@()magic(1000);
fun{3}=@()ones(1000,1000);
counts=arrayfun(@(x) timeit(x{:}),fun)