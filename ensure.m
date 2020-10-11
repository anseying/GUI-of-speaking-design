%该函数主要是提供 " 保存 " 确认信息
function  ensure()
hfigure=figure('units','pixels','name','确认信息','menubar','none','position',[475 170 250 150],...
    'DockControls','off','numbertitle','off','visible','on');
movegui(hfigure,'center');     %使GUI移动到中心
mfigure=uicontrol('fontweight','bold','fontsize',12,'string','确定','position',[100 25 55 25],'callback','isClosed=true;close');
% set(mfigure,'defaultuicontrolfontsize',16,'defaultuicontrolfontweight','bold')
uicontrol('foregroundcolor','r','string','保存成功！','position',[70 85 120 40],...
'background','default','fontsize',16) ;  

% set(0,'defaultuicontrolfontsize',14,'defaultuicontrolfontweight','bold')
 pause(3);
if ishandle(hfigure)
delete(hfigure);
end        