function varargout = LSP(varargin)
% LSP MATLAB code for LSP.fig
%      LSP, by itself, creates a new LSP or raises the existing
%      singleton*.
%
%      H = LSP returns the handle to a new LSP or the handle to
%      the existing singleton*.
%
%      LSP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LSP.M with the given input arguments.
%
%      LSP('Property','Value',...) creates a new LSP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LSP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LSP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LSP

% Last Modified by GUIDE v2.5 06-Jun-2017 16:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LSP_OpeningFcn, ...
                   'gui_OutputFcn',  @LSP_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LSP is made visible.
function LSP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LSP (see VARARGIN)

% Choose default command line output for LSP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = LSP_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function slider1_Callback(hObject, eventdata, handles)
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit19_Callback(hObject, eventdata, handles)
function edit19_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit20_Callback(hObject, eventdata, handles)
function edit20_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton3.
%   ‘绘画’键的 主要内容 。
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Pcc=0;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(((fid{4})));        %语音数据长度
F_freq=str2num(((fid{5})));          %语音采样频率
F_PicWidth=str2num((fid{6}));                  %图片宽度
a_time=(F_long(1)/F_freq(1));
%strtrim
set(handles.edit2,'string',a_time);
% set(handles.edit16,'string',a_time);
% set(handles.edit25,'string',a_time);
% set(handles.edit14,'string',F_PicWidth);
    Cfactor1=str2num(get(handles.edit11,'string'));   % 0 长       
    Cfactor2=str2num(get(handles.edit25,'string')) ;  %    长   
    Cfactor3=str2num(get(handles.edit13,'string'));   % 0 宽
    Cfactor4=str2num(get(handles.edit14,'string'));   %    宽
    Cfactor11=str2num(get(handles.edit15,'string'));   % 时长 0    
    Cfactor12=str2num(get(handles.edit16,'string'));  %  时长
     %%%=================================================
     %为了改变   ‘0’参数
    Cfactor_B=[0 0 0];  
    Cfactor_P(1)=Jnum(Cfactor1);          
    if ~Cfactor_P(1)   
        set(handles.edit11,'string',num2str(Cfactor_B(1)));
        Cfactor1=Cfactor_B(1);     disp('~Cfactor_P(1)  ')
    end
    Cfactor_P(2)=Jnum(Cfactor3);           
    if ~Cfactor_P(2)   
        set(handles.edit13,'string',num2str(Cfactor_B(2)));
        Cfactor3=Cfactor_B(2);       disp('~Cfactor_P(2)  ')
    end
    Cfactor_P(3)=Jnum(Cfactor11);           
    if ~Cfactor_P(3)   
        set(handles.edit15,'string',num2str(Cfactor_B(3)));
        Cfactor11=Cfactor_B(3);      disp('~Cfactor_P(3)  ')
    end
        Cfactor_P=sum(Cfactor_P);
    if Cfactor_P~=3            %弹出被改动错误信息
        ensure5;                   disp('Cfactor_P(3)  ')
    end
    %%%=================================================
     if (Cfactor2-a_time)>0.0001
         set(handles.edit25,'string',a_time);
         ensure5;         
     end
%      Cfactor4
%      F_PicWidth
     if Cfactor4~=F_PicWidth
         set(handles.edit14,'string',F_PicWidth);
         ensure5;          disp('Cfactor4~=F_PicWidth')
     end
     if (Cfactor12-a_time)>0.0001
         set(handles.edit16,'string',a_time);
         ensure5;           
     end
    %%===================================================
    %    对输入的数据进行判断
    wcc=0;lcc=0;                         %判断图片设置信息，是否合法
    Cfactor5=str2num(get(handles.edit21,'string')) ;   % 图长   Left
    Cfactor6=str2num(get(handles.edit22,'string')) ;   % 图长   Right
    Cfactor7=str2num(get(handles.edit19,'string'))  ;  % 图宽   Left
    Cfactor8=str2num(get(handles.edit20,'string')) ;   % 图宽   Right
    
    Cfactor_Pl(1)=Jnum(Cfactor5);          
    if ~Cfactor_Pl(1)   
        set(handles.edit21,'string','0');   
        Cfactor5=0;
    end
    Cfactor_Pl(2)=Jnum(Cfactor6);           
    if ~Cfactor_Pl(2)   
        set(handles.edit22,'string','0');
        Cfactor6=0;
    end
    Cfactor_Pl(3)=Jnum(Cfactor7);           
    if ~Cfactor_Pl(3)   
        set(handles.edit19,'string','0');
        Cfactor7=0
    end  
    Cfactor_Pl(4)=Jnum(Cfactor8);           
    if ~Cfactor_Pl(4)   
        set(handles.edit20,'string','0')
        Cfactor8=0
    end
    
    Cfactor_Pl=sum(Cfactor_Pl);
    if Cfactor_Pl~=4            %弹出数据错误信息
        ensure4;lcc=1;wcc=1;     
    end
%     Cfactor6 ;
%     a_time;
    if Cfactor5>=Cfactor6         %对“设置时长”数据信息的判断
        ensure4;lcc=1;
        set(handles.edit21,'string','0');                    %出错设置默认 ‘0’
        set(handles.edit22,'string','0'); 
    elseif Cfactor5<0
        ensure4;lcc=1;                     disp('Cfactor5<0')
        set(handles.edit21,'string','0');
        set(handles.edit22,'string','0'); 
    elseif Cfactor6>a_time
        ensure4;lcc=1;                    disp('Cfactor6>a_time')
        set(handles.edit21,'string','0');
        set(handles.edit22,'string','0'); 
    end
        
    if Cfactor7>=Cfactor8  && lcc==0       %对“设置图宽”数据信息的判断
        ensure4;wcc=1;                                %避免时长问题对“设置时长”的重复判断
        set(handles.edit19,'string','0');              %出错设置默认 ‘0’
        set(handles.edit20,'string','0'); 
    elseif Cfactor7<0
        ensure4;wcc=1;
        set(handles.edit19,'string','0');
        set(handles.edit20,'string','0'); 
    elseif Cfactor8>F_PicWidth
        ensure4;  wcc=1;
        set(handles.edit19,'string','0');
        set(handles.edit20,'string','0'); 
    end
    if wcc==0 & lcc==0;
%         global  color_val;                      %检测色彩值
%         switch get(handles.radiobutton2,'tag')
%             case 'radiobutton1'
%                 color_val=0;
%             case 'radiobutton2'
%                 color_val=1;
%         end
        subplot(311);
        axis([Cfactor5 Cfactor6 Cfactor7 Cfactor8]);
        subplot(312);
        axis([Cfactor5 Cfactor6 Cfactor7 Cfactor8]);
        subplot(313);
        axis([Cfactor5 Cfactor6 Cfactor7 Cfactor8]);
        pcc=1;
    end

        set(handles.edit33,'string','1');

    
   %%===================================================    

% --- Executes on button press in pushbutton7.
 % 初始化
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fid=textread('JBMM.txt','%s','delimiter','\n');

File_N=length(fid);
if File_N<=3
    ensure10;
elseif File_N>3
        Name=fid{3}
        Name=num2str(Name);      %问题读入该数据时，长度为29
        %不是印象中的原式
        Name=strtrim(Name);                   %去除开头或结尾处的空格
        if strcmp(Name,'JBPJ')
             set(handles.edit1,'string','基本谱减法语谱图');
        elseif strcmp(Name,'BOLL')  
            set(handles.edit1,'string','Boll改进法语谱图');
        elseif strcmp(Name,'MJBPJ')  
            set(handles.edit1,'string','多窗谱估计法语谱图');
        elseif strcmp(Name,'MMSE')  
            set(handles.edit1,'string','MMSE语谱图');
        else
           set(handles.edit1,'string','Something Wrong!');
        end
        F_long=str2num(strtrim((fid{4})));          %语音数据长度
        F_freq=str2num(strtrim((fid{5})));          %语音采样频率
        F_PicWidth=strtrim((fid{6}));                  %图片宽度
        a_time=F_long(1)/F_freq(1);

        set(handles.edit2,'string',a_time);               %总时长
        set(handles.edit16,'string',a_time);             %参考总时长
        set(handles.edit25,'string',a_time);             %图片参考 “长”
        set(handles.edit14,'string',F_PicWidth);     %图片参考“宽”

        set(handles.edit15,'string','0');                %参考时长   “0”
        set(handles.edit11,'string','0');                %图片参考      “长0”
        set(handles.edit13,'string','0');                %图片参考     “宽0”

        set(handles.edit22,'string','0');                %设置时长  右    “0”
        set(handles.edit21,'string','0');                %设置时长  左  “0”
        set(handles.edit19,'string','0');                %设置图宽  左    “0”
        set(handles.edit20,'string','0');                %设置图宽  右    “0”
        set(handles.edit33,'string','0');                 %设置是否进行了绘画、步进的判断
        %    Cfactor9=str2num(get(handles.edit18,'string'));    % 步进长
        %     Cfactor5=str2num(get(handles.edit21,'string')) ;   % 图长   Left
        %     Cfactor6=str2num(get(handles.edit22,'string')) ;   % 图长   Right
        %     Cfactor7=str2num(get(handles.edit19,'string'))  ;  % 图宽   Left
        %     Cfactor8=str2num(get(handles.edit20,'string')) ;   % 图宽   Right
%         global  color_val;
%         color_val=get(handles.radiobutton2,'value');    
        global Cfactor3 Cfactor5

        wav_printLSp1(Cfactor3,Cfactor5);
        set(handles.edit32,'string',num2str(Cfactor5));
        set(handles.slider2,'value',Cfactor5);

end

% --- Executes on key press with focus on pushbutton7 and none of its controls.
function pushbutton7_KeyPressFcn(hObject, eventdata, handles)

% --- Executes on button press in pushbutton2.
%   "长步进"  时间
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%====================================================
%     Cfactor9=str2num(get(handles.edit18,'string'));    % 步进长
%%====================================================
    Lcc=0;                 %问题总判断条件
    Pcc=0;                 %是否进行绘图的判断
    Cfactor5=str2num(get(handles.edit21,'string')) ;   % 图长   Left
    Cfactor6=str2num(get(handles.edit22,'string')) ;   % 图长   Right
    Cfactor7=str2num(get(handles.edit19,'string'))  ;  % 图宽   Left
    Cfactor8=str2num(get(handles.edit20,'string')) ;   % 图宽   Right
    
    Cfactor_P(1)=Jnum(Cfactor5);                                %仅仅是为了改变错误数据
    if ~Cfactor_P(1)   
        set(handles.edit21,'string','0');
    end
    Cfactor_P(2)=Jnum(Cfactor6);
    if ~Cfactor_P(2)   
        set(handles.edit22,'string','0');
    end
    Cfactor_P(3)=Jnum(Cfactor7);           %帧移比
    if ~Cfactor_P(3)   
        set(handles.edit19,'string','0')
    end
    Cfactor_P(4)=Jnum(Cfactor8);
    if ~Cfactor_P(4)   
        set(handles.edit20,'string','0')
    end
   Cfactor_P=sum(Cfactor_P);
    if Cfactor_P~=4            %弹出因子设置出错框口
        ensure1;Lcc=1;         %进行默认数据
    elseif Cfactor5>=Cfactor6 | Cfactor7>=Cfactor8
        ensure7;Lcc=1;
    elseif Cfactor5<0 | Cfactor6<0 | Cfactor7<0 | Cfactor8<0
        ensure7;Lcc=1;
    else 
%%====================================================
% 总判决条件 的开始
        set(handles.edit31,'string','0');   
        Cfactor12=str2num(get(handles.edit16,'string'));  %  时长   或  片宽

        Cfactor10=str2num(get(handles.edit18,'string'));  % 步进长  或宽步进

        Cfactor_B=[0.4];
        Cfactor_P(1)=Jnum(Cfactor10);                                
        if ~Cfactor_P(1)                                  %判断数据输入是否合法
            set(handles.edit1,'string',num2str(Cfactor_B(1)));
            Cfactor10=Cfactor_B(1);
            ensure4;Lcc=1;           disp('~Cfactor_P(1)')
        end

        P_AL=str2num(get(handles.edit28,'string')) ; %得到标志位判断
        if P_AL==0
                P_longL=Cfactor10+Cfactor5;           %左或下
                P_longR=Cfactor10+Cfactor6;           %右或上
                set(handles.edit28,'string','1');
        elseif P_AL==1
            P_longL=str2num(get(handles.edit26,'string')); %隐藏左  下
            P_longR=str2num(get(handles.edit27,'string')); %隐藏又  上
            P_longL=P_longL+Cfactor10;
            P_longR=P_longR+Cfactor10;
        else
            disp('重大错误！！');
        end
    %     Cfactor10
    %     Cfactor12
        if abs(Cfactor10)>Cfactor12       %判断总时长是否超范; 并对初始数据
            Cfactor10=Cfactor_B(1);                  %进行修改
            ensure4;Lcc=1;          disp('abs(Cfactor10)>Cfactor12')
        end
        if (P_longL<0) & (P_longR<Cfactor12)
            ensure4;                 disp('(P_longL<0) & (P_longR<Cfactor12)')
            numL=0;numR=(abs(P_longL)+P_longR);   %左与右
            numS=Cfactor7; numX=Cfactor8;                 %上与下
            subplot(311);
            axis([numL numR numS numX]);
            subplot(312);
            axis([numL numR numS numX]);
            subplot(313);
            axis([numL numR numS numX]);
            Pcc=1;
        elseif (P_longR>Cfactor12) & (P_longL<P_longR)
            ensure4;            disp('(P_longR>Cfactor12) & (P_longL<P_longR)')
            numL=(P_longL- (P_longR-Cfactor12)); numR=Cfactor12;
            numS=Cfactor7;       numX=Cfactor8;
            subplot(311);
            axis([numL numR numS numX]);
            subplot(312);
            axis([numL numR numS numX]);
            subplot(313);
            axis([numL numR numS numX]);
            Pcc=1;
        elseif Lcc==0
            numL=P_longL;  numR=P_longR;
            numS=Cfactor7;  numX=Cfactor8;
            subplot(311);
            axis([numL numR numS numX]);
            subplot(312);
            axis([numL numR numS numX]);
            subplot(313);
            axis([numL numR numS numX]);
            Pcc=1;
        end
        if Pcc==1
            set(handles.edit33,'string','1');
             set(handles.edit21,'string',num2str(numL));
             set(handles.edit22,'string',num2str(numR));
             set(handles.edit19,'string',num2str(numS));      %下
             set(handles.edit20,'string',num2str(numX));      %上与下弄反了
        end
        if Lcc==0
            set(handles.edit26,'string',num2str(P_longL));    %隐藏左
            set(handles.edit27,'string',num2str(P_longR));    %隐藏又
        end
    end

function edit18_Callback(hObject, eventdata, handles)
function edit18_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit15_Callback(hObject, eventdata, handles)
function edit15_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit16_Callback(hObject, eventdata, handles)
function edit16_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit12_Callback(hObject, eventdata, handles)
function edit12_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)
function edit13_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit14_Callback(hObject, eventdata, handles)
function edit14_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('确定退出','退出','YES','NO','YES');
if strcmp(button,'YES')
    close('LSP');
%     run('Fdegree');
elseif strcmp(button,'NO')
    return;
end

function edit21_Callback(hObject, eventdata, handles)

function edit21_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit22_Callback(hObject, eventdata, handles)
function edit22_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit24_Callback(hObject, eventdata, handles)
function edit24_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
%   “宽步进”       频率步进
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   Lcc=0;                 %问题总判断条件
   Pcc=0;                %是否进行绘画的判断
    Cfactor5=str2num(get(handles.edit21,'string')) ;   % 图长   Left
    Cfactor6=str2num(get(handles.edit22,'string')) ;   % 图长   Right
    
    Cfactor7=str2num(get(handles.edit19,'string'))  ;  % 图宽   Left
    Cfactor8=str2num(get(handles.edit20,'string')) ;   % 图宽   Right
        Cfactor_P(1)=Jnum(Cfactor5);                                %仅仅是为了改变错误数据
    if ~Cfactor_P(1)   
        set(handles.edit21,'string','0');
    end
    Cfactor_P(2)=Jnum(Cfactor6);
    if ~Cfactor_P(2)   
        set(handles.edit22,'string','0');
    end
    Cfactor_P(3)=Jnum(Cfactor7);           %帧移比
    if ~Cfactor_P(3)   
        set(handles.edit19,'string','0')
    end
    Cfactor_P(4)=Jnum(Cfactor8);
    if ~Cfactor_P(4)   
        set(handles.edit20,'string','0')
    end
   Cfactor_P=sum(Cfactor_P);
    if Cfactor_P~=4            %弹出因子设置出错框口
        ensure1;Lcc=1;         %进行默认数据
    elseif Cfactor5>=Cfactor6 | Cfactor7>=Cfactor8
        ensure7;Lcc=1;
    elseif Cfactor5<0 | Cfactor6<0 | Cfactor7<0 | Cfactor8<0
        ensure7;Lcc=1;
    else 
    %%===================================================
    %%====  提供 先期 判断数据
        set(handles.edit28,'string','0');   
        Cfactor12=str2num(get(handles.edit14,'string'));  %  时长   或  片宽

        Cfactor10=str2num(get(handles.edit24,'string'));  % 步进长  或宽步进

        Cfactor_B=[400];
        Cfactor_P(1)=Jnum(Cfactor10);                                
        if ~Cfactor_P(1)                                  %判断数据输入是否合法
            set(handles.edit1,'string',num2str(Cfactor_B(1)));
            Cfactor10=Cfactor_B(1);
            ensure4;Lcc=1;           disp('~Cfactor_P(1)')
        end

        P_AL=str2num(get(handles.edit31,'string')) ; %得到标志位判断
        if P_AL==0
                P_longL=Cfactor10+Cfactor7;           %左或下
                P_longR=Cfactor10+Cfactor8;           %右或上
                set(handles.edit31,'string','1');
        elseif P_AL==1
            P_longL=str2num(get(handles.edit29,'string')); %隐藏左  下
            P_longR=str2num(get(handles.edit30,'string')); %隐藏又  上
            P_longL=P_longL+Cfactor10;
            P_longR=P_longR+Cfactor10;
        else
            disp('重大错误！！');
        end

    %     Cfactor10
    %     Cfactor12
        if abs(Cfactor10)>Cfactor12       %判断总时长是否超范; 并对初始数据
            Cfactor10=Cfactor_B(1);                  %进行修改
            ensure4;Lcc=1;          disp('abs(Cfactor10)>Cfactor12')
        end

        Cfactor5, Cfactor6, (P_longL- (P_longR-Cfactor12)), Cfactor12
        if (P_longL<0) & (P_longR<Cfactor12)
            ensure4;                 disp('(P_longL<0) & (P_longR<Cfactor12)')
            numL=Cfactor5; numR=Cfactor6;
            numS=0; numX=(abs(P_longL)+P_longR);
            subplot(311);
            axis([numL numR numS numX ]);
            subplot(312);
            axis([numL numR numS numX ]);
            subplot(313);
            axis([numL numR numS numX ]);
            Pcc=1;
        elseif (P_longR>Cfactor12) & (P_longL<P_longR)
            ensure4;            disp('(P_longR>Cfactor12) & (P_longL<P_longR)')
            numL=Cfactor5; numR=Cfactor6;
            numS=(P_longL- (P_longR-Cfactor12)); numX=Cfactor12;
            subplot(311);
            axis([numL numR numS numX]);
            subplot(312);
            axis([numL numR numS numX]);
            subplot(313);
            axis([numL numR numS numX]);
            Pcc=1;
        elseif Lcc==0
            numL=Cfactor5; numR=Cfactor6;
            numS=P_longL; numX=P_longR;
            subplot(311);
            axis([numL numR numS numX]);
            subplot(312);
            axis([numL numR numS numX]);
            subplot(313);
            axis([numL numR numS numX]);
            Pcc=1;
        end
        if Pcc==1
             set(handles.edit33,'string','1');
             set(handles.edit21,'string',num2str(numL));
             set(handles.edit22,'string',num2str(numR));
             set(handles.edit19,'string',num2str(numS));      %下
             set(handles.edit20,'string',num2str(numX));      %上与下弄反了       
        end
        if Lcc==0
            set(handles.edit29,'string',num2str(P_longL));    %隐藏左
            set(handles.edit30,'string',num2str(P_longR));    %隐藏又
        end
 end


function edit25_Callback(hObject, eventdata, handles)
function edit25_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit26_Callback(hObject, eventdata, handles)
function edit26_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit27_Callback(hObject, eventdata, handles)
function edit27_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit28_Callback(hObject, eventdata, handles)
function edit28_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit29_Callback(hObject, eventdata, handles)
function edit29_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit30_Callback(hObject, eventdata, handles)
function edit30_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit31_Callback(hObject, eventdata, handles)
function edit31_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
%%%%    滑动条设置
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Cfactor3 val;

val=round(get(hObject,'value'))
%由于进行分帧处理时不能存在奇数，只能是偶数
%所以要进行判断
if mod(val,2)==1
    val=val+1;
end

set(handles.edit32,'string',num2str(round(val),'%d'));

    P1=str2num(get(handles.edit11,'string')) ;   % 时间   Left
    P2=str2num(get(handles.edit25,'string')) ;   % 时间   Right
    P3=str2num(get(handles.edit13,'string')) ;   % 频率   下   down
    P4=str2num(get(handles.edit14,'string')) ;   % 频率   上   up
    
    P11=str2num(get(handles.edit21,'string')) ;   % 时间   Left
    P22=str2num(get(handles.edit22,'string')) ;   % 时间   Right
    P33=str2num(get(handles.edit19,'string')) ;   % 频率   下   down
    P44=str2num(get(handles.edit20,'string')) ;   % 频率   上   up

    PP=str2num(get(handles.edit33,'string'))
    if PP==0
        wav_printLSp1(Cfactor3,round(val));
    elseif PP==1
        wav_printLSp1(Cfactor3,round(val));
        subplot(311);
        axis([P11 P22 P33 P44]);
         subplot(312);
        axis([P11 P22 P33 P44]);
        subplot(313);
        axis([P11 P22 P33 P44]);
    end
        
% set(handles.edit21,'string',num2str(numL));
% set(handles.edit22,'string',num2str(numR));
% set(handles.edit19,'string',num2str(numS));      %下
% set(handles.edit20,'string',num2str(numX));      %上与下弄反了 

% map=str2double(get(handles.edit4,'string'));    %给滑动条进行幅值
% set(handles.slider2,'value',map);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cfactor3 val
        global  color_val;
%         switch get(handles.radiobutton2,'tag')
%             case 'radiobutton1'
%                 color_val=0;
%             case 'radiobutton2'
%                 color_val=1;
%         end
% Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
if ~isempty(val)
    color_val=1;
    wav_printLSp(Cfactor3,round(val));
else
    ensure10;
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
