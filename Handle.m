

% t=-pi:0.01:pi;
% plotSin(@sin,t)

% plotSin2=@(x)plot(x,sin(x));

% % �������������������غ������
% %�������������⹹�죬û�к�������ֻ�о��
% %ʹ��д��ִ࣬��Ч�ʸߣ�

% t=-pi:0.01:pi;
% plotSin(t);

% ��������ǽ������ġ����������������ľ����������ִ��
%    arrayfun
% fun{1}=rand(3,6);
% fun{2}=magic(12);
% fun{3}=ones(5,10);
% counts=arrayfun(@(x) numel(x{:}),fun)      %ͳ��ÿ�������ĸ���

fun{1}=@()rand(1,10^6);
fun{2}=@()magic(1000);
fun{3}=@()ones(1000,1000);
counts=arrayfun(@(x) timeit(x{:}),fun)