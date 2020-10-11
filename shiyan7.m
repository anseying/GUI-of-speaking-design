

fid=fopen('JBMM.txt','r');        
% data = textscan(fid,'%*[^\n]');
fid=textread('JBMM.txt','%s','delimiter','\n')
length(fid)
% length(data)
% data
%  length( regexp(data,'%*[^\n]','match'))