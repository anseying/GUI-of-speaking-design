%LSP进行提供数据输入错误  
function  ensure7()
hfigure=figure('units','pixels','name','数据错误','menubar','none','position',[475 170 250 150],...
    'DockControls','off','numbertitle','off','visible','on');
movegui(hfigure,'center');     %使GUI移动到中心
mfigure=uicontrol('fontweight','bold','fontsize',12,'string','确定','position',...
[100 25 55 25],'callback','isClosed=true;close');
% set(mfigure,'defaultuicontrolfontsize',16,'defaultuicontrolfontweight','bold')
uicontrol('foregroundcolor','r','string','数据输入错误！','position',...
[15 85 230 30],'background','default','fontsize',12) ;  

% set(0,'defaultuicontrolfontsize',14,'defaultuicontrolfontweight','bold')
pause(3.5);
if ishandle(hfigure)
delete(hfigure);
end