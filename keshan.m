%% 坚决不能删
%复杂的逻辑判断 + 必要的数据正则表达式进行改进
function c=keshan(a,b)
global kk
kk=kk+3
c=a+b
a
b
%regexp : /^\d+.?\d+$|^\d&/    %不懂该正则表达式
%
%isempty
%利用正则表达式来判断是否输入正确
%正则表达式
%regexp(b,'^\d{3}$','once')  %判断 b 中的数据是否为三位
%
% regexp(f,'^[0-9]{8}$','once')            %判断 ‘f’是否为8位数字
% 
% ans =
% 
%      1


%% =============
% a =                     %判断输入是否为数据
% 
% 123465
% 
% regexp(a,'^[0-9]+$','once')
% 
% ans =
% 
%      1
%% ===========
% a='123.123';                     %判定特定的
% regexp(a,'^[0-9]+.+[0-9]+$','once')
% 
% ans =
% 
%      1
%% ===========
% b='3.456';                 %%匹配特定长度、特定格式的字符串
%前提是输入的数据为字符串      第一个数字为
% regexp(b,'^[0-9]{1}+[.]+[0-9]{0,4}+$','once')
% 
% ans =
% 
%      1

%% ======         匹配带有固定小数或固定长的数据
% b=132465;
% regexp(b,'[(^[0-9]{1}+[.]+[0-9]{0,4}+$ )| (^[0-9]+$)]','once')
% 
% ans =
% 
%      1
%% ==           判断文件的行数

fid=fopen('JBMM.txt','r');        
% data = textscan(fid,'%*[^\n]');
fid=textread('JBMM.txt','%s','delimiter','\n')
length(fid)
% length(data)
% data
%  length( regexp(data,'%*[^\n]','match'))

