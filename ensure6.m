%LSP���л滭ʱ�ṩ������Ϣ    
function  ensure6()
hfigure=figure('units','pixels','name','���ݳ���','menubar','none','position',[475 170 250 150],...
    'DockControls','off','numbertitle','off','visible','on');
movegui(hfigure,'center');     %ʹGUI�ƶ�������
mfigure=uicontrol('fontweight','bold','fontsize',12,'string','ȷ��','position',...
[100 25 55 25],'callback','isClosed=true;close');
% set(mfigure,'defaultuicontrolfontsize',16,'defaultuicontrolfontweight','bold')
uicontrol('foregroundcolor','r','string','�����Ѿ�������Χ��','position',...
[15 85 230 30],'background','default','fontsize',12) ;  

% set(0,'defaultuicontrolfontsize',14,'defaultuicontrolfontweight','bold')
pause(3.5);
if ishandle(hfigure)
delete(hfigure);
end