% fig.units='pixels';
% fig.position=[500 300 600 200];
% fig.windowstyle='modal';
% fig.menubar='none';
% fig.name='ee';
% fig.numbertitle='off';
% h=figure(fig);
% % ��֪Ϊ�Σ�2016�汾�����������ã����

% sel=questdlg('ȷ�Ϲرյ�ǰ����','�ر�ȷ��','yes','no','no');
% switch sel
%     case 'yes'
%         delete(h0bject)
%     case 'no'
%         return
% end
% %��ӵķ���ȷ������


% text('string','����ʫ�����Ի�','fontsize',16,'position',[0.2 0.3],...
%     'horizontalalignment','left','verticalalignment','middle',...
%     'rotation',60,'margin',1);
% text('string','�������ĥ�³�','backgroundcolor','y',...
%     'fontsize',16,'position',[0.5 0.68],...
%     'horizontalalignment','left','verticalalignment','middle',...
%     'rotation',-60,'margin',1);
%%��ʾ����


[filename,pathname]=uigetfile('*.txt','multiselect','on');
fid=fopen(filename,'w');
a=[9 8 7 4 5 6 1 2 3 0 2 0 20 3 6];
fprintf(fid,'\n%d ',a);
fclose(fid);

% % fid=fopen('xnshiyan.txt');
% % a=fscanf(fid,'%g');
% % min=reshape(a,2,6);



