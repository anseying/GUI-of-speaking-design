%DPTT进行提供操作次序确定 
function  ensure8()
hfigure=figure('units','pixels','name','警告信息','menubar','none','position',[475 170 250 150],...
    'DockControls','off','numbertitle','off','visible','on');
movegui(hfigure,'center');     %使GUI移动到中心
mfigure=uicontrol('fontweight','bold','fontsize',12,'string','确定','position',...
[100 25 55 25],'callback','isClosed=true;close');
% set(mfigure,'defaultuicontrolfontsize',16,'defaultuicontrolfontweight','bold')
uicontrol('foregroundcolor','r','string',['若输入点数请大于总时长！']...
    ,'position',[15 100 230 30],'background','default','fontsize',12) ;  
uicontrol('foregroundcolor','r','string','否则默认为时间！','position',...
[15 70 230 30],'background','default','fontsize',12) ; 
% set(0,'defaultuicontrolfontsize',14,'defaultuicontrolfontweight','bold')
pause(5);
if ishandle(hfigure)
delete(hfigure);
end