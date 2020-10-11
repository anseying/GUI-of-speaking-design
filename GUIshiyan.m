% fig.units='pixels';
% fig.position=[500 300 600 200];
% fig.windowstyle='modal';
% fig.menubar='none';
% fig.name='ee';
% fig.numbertitle='off';
% h=figure(fig);
% % 不知为何，2016版本不能正常运用，奇怪

% sel=questdlg('确认关闭当前窗口','关闭确定','yes','no','no');
% switch sel
%     case 'yes'
%         delete(h0bject)
%     case 'no'
%         return
% end
% %添加的返回确定窗口


% text('string','腹有诗书气自华','fontsize',16,'position',[0.2 0.3],...
%     'horizontalalignment','left','verticalalignment','middle',...
%     'rotation',60,'margin',1);
% text('string','宝剑锋从磨砺出','backgroundcolor','y',...
%     'fontsize',16,'position',[0.5 0.68],...
%     'horizontalalignment','left','verticalalignment','middle',...
%     'rotation',-60,'margin',1);
%%显示汉字


[filename,pathname]=uigetfile('*.txt','multiselect','on');
fid=fopen(filename,'w');
a=[9 8 7 4 5 6 1 2 3 0 2 0 20 3 6];
fprintf(fid,'\n%d ',a);
fclose(fid);

% % fid=fopen('xnshiyan.txt');
% % a=fscanf(fid,'%g');
% % min=reshape(a,2,6);



