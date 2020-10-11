function varargout = DPTT(varargin)
% DPTT MATLAB code for DPTT.fig
%      DPTT, by itself, creates a new DPTT or raises the existing
%      singleton*.
%
%      H = DPTT returns the handle to a new DPTT or the handle to
%      the existing singleton*.
%
%      DPTT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DPTT.M with the given input arguments.
%
%      DPTT('Property','Value',...) creates a new DPTT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DPTT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DPTT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DPTT

% Last Modified by GUIDE v2.5 03-Jun-2017 14:40:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DPTT_OpeningFcn, ...
                   'gui_OutputFcn',  @DPTT_OutputFcn, ...
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


% --- Executes just before DPTT is made visible.
function DPTT_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


function varargout = DPTT_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit16_Callback(hObject, eventdata, handles)

function edit16_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

button=questdlg('确定退出','退出','YES','NO','YES');
if strcmp(button,'YES')
    close('DPTT');
%     run('Fdegree');
elseif strcmp(button,'NO')
    return;
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton4.
%%%==========  保存键
function pushbutton4_Callback(hObject, eventdata, handles)

    global APK1 scc;           %保存键
    APK1=get(handles.popupmenu1,'value');
scc=1;             %判断Long系统是用方案长度还是工具长度
wav_KBoardsave();                  %保存文件？

% --- Executes on button press in pushbutton1.
%  ‘绘画键’
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs;
global Long1 Long2 C_Long1 C_Long2;
C_Long1=Long1;
C_Long2=Long2;
    Cfactor1=str2num(get(handles.edit1,'string'));   % 语音长度 ‘1’  
     Cfactor3=str2num(get(handles.edit3,'string'));   %  采样频率 ‘8000’
    Cfactor12=str2num(get(handles.edit15,'string'));  %  长步进‘0.4’
    
    Cfactor2=str2num(get(handles.edit2,'string')) ;  %  语音长度 ‘0’      
    Cfactor4=str2num(get(handles.edit4,'string'));   %  SNR1      ‘0’
    Cfactor5=str2num(get(handles.edit6,'string'));   % SNR2        ‘0’
    Cfactor6=str2num(get(handles.edit5,'string'));  %  SNR           ‘0’
    Cfactor7=str2num(get(handles.edit10,'string'));   % 开始语音 ‘0’   
    Cfactor8=str2num(get(handles.edit11,'string')) ;  % 结束语音 ‘0’
    Cfactor9=str2num(get(handles.edit9,'string'));   % 分 SNR1    ‘0’
    Cfactor10=str2num(get(handles.edit7,'string'));   % 分SNR2     ‘0’
    Cfactor11=str2num(get(handles.edit8,'string'));   %  分SNR        ‘0’
    
    Cfactor13=str2num(get(handles.edit17,'string'));     %总时长

    %%========================================
    %%%   为零数据判断
    cc=0;                       %判断外层条件是否满足
    Cfactor_B=0;                        %数据的判断
    ktt=0;                       %判断绘画是否执行
    Cfactor_P(1)=Jnum(Cfactor2);                                
    if ~Cfactor_P(1)   
        set(handles.edit2,'string','0');
        Cfactor2=Cfactor_B(1);
    end
    Cfactor_P(2)=Jnum(Cfactor4);
    if ~Cfactor_P(2)   
        set(handles.edit4,'string','0');
        Cfactor4=Cfactor_B(1);
    end
    Cfactor_P(3)=Jnum(Cfactor5);         
    if ~Cfactor_P(3)   
        set(handles.edit6,'string','0')
        Cfactor5=Cfactor_B(1);
    end
    Cfactor_P(4)=Jnum(Cfactor6);
    if ~Cfactor_P(4)   
        set(handles.edit5,'string','0')
        Cfactor6=Cfactor_B(1);
    end
    Cfactor_P(5)=Jnum(Cfactor7);
    if ~Cfactor_P(5)   
        set(handles.edit10,'string','0')
        Cfactor7=Cfactor_B(1);
    end
Cfactor_P(6)=Jnum(Cfactor8);                              
    if ~Cfactor_P(6)   
        set(handles.edit11,'string','0');
        Cfactor8=Cfactor_B(1);
    end
    Cfactor_P(7)=Jnum(Cfactor9);
    if ~Cfactor_P(7)   
        set(handles.edit9,'string','0');
        Cfactor9=Cfactor_B(1);
    end
    Cfactor_P(8)=Jnum(Cfactor10);           
    if ~Cfactor_P(8)   
        set(handles.edit7,'string','0')
        Cfactor10=Cfactor_B(1);
    end
    Cfactor_P(9)=Jnum(Cfactor11);
    if ~Cfactor_P(9)   
        set(handles.edit8,'string','0')
        Cfactor11=Cfactor_B(1);
    end
    if sum(Cfactor_P(1:9))~=9
        ensure5;cc=1;
        disp('sum(Cfactor_P(1:9))~=9')
    end
 %%%%%%%%========================  ==========
 %不为零数据判断
    Cfactor_Pl(1)=Jnum(Cfactor3);          %采样频率
    if ~Cfactor_Pl(1)   
        set(handles.edit3,'string',num2str(fs));
        Cfactor3=fs;
        disp('~Cfactor_Pl(1) ')
    end
    Cfactor_Pl(2)=Jnum(Cfactor12);        %长步进量
    if ~Cfactor_Pl(2)   
        set(handles.edit15,'string',num2str(0.4));
        Cfactor5=0.4;
        disp('~Cfactor_Pl(2)')
    end
    Cfactor_Pl(3)=Jnum(Cfactor1);        %语音长度
    if ~Cfactor_Pl(2)   
        set(handles.edit15,'string','1');
        Cfactor1=Cfactor_B(5);
        disp('~Cfactor_Pl(2) ')
    end
    if sum(Cfactor_Pl)~=3
        ensure4;    cc=1;
        disp('sum(Cfactor_Pl(3))~=3')
    end
       PLanLZ=Cfactor1;    %语音开始长度
        PLanLE=Cfactor2;   %语音结束长度
        LanS=Cfactor7;   %语音开始
        LanE=Cfactor8;   %语音结束  
        
        if LanS<0 | LanS>LanE           %对设置开始语音逻辑判断
            ensure4;cc=1;
            disp('LanS<0 | LanS>LanE');
        end
        if LanE<0 | LanE>PLanLE     %对设置结束语音逻辑判断
            ensure4;cc=1;
            disp('LanE<0 | LanE>PLanLE')
        end
        if LanS>=LanE
            ensure4;cc=1;
        end
  %%%==================================================
  %%%真正的语音运行    
    if cc==0
        kcc=str2num(get(handles.edit14,'string'));        %用来判断步进问题  
        if (Cfactor8>Cfactor13) && kcc==0 && cc==0
            Long1_time=Cfactor7/fs;                         %用来判定数据是否为数据
            Long2_time=Cfactor8/fs;
                ensure8;                                   %判定输入为时间
        elseif kcc==0
            Long1_time=Cfactor7;
            Long2_time=Cfactor8;
        end
 %%%%======================      绘画部分
         Plimit=str2num(get(handles.edit18,'string')) ;
        if kcc==0
            axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
            axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
            axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]);
            set(handles.edit14,'string','0');             %%%%%?????
            ktt=1;
        elseif kcc==1
            Long1_time=str2num(get(handles.edit12,'string'));
            Long2_time=str2num(get(handles.edit13,'string'));
            axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
            axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
            axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]);
            set(handles.edit14,'string','0');
            ktt=1;
        end          
    end
     %%% %%==============分段信噪比计算 
    if ktt==1 && cc==0
            if Long1_time==0
                C_Long1=1;
                C_Long2=fix(Long2_time*fs);
            else
                C_Long1=ceil(Long1_time*fs);
                C_Long2=fix(Long2_time*fs);
            end
                 fidlc=fopen('cjyy.txt','r+');
                 favelc=fscanf(fidlc,'%f');

                 fidlh=fopen('hzyy.txt','r+');
                 favelh=fscanf(fidlh,'%f');

                 fidll=fopen('lbyy.txt','r+');
                 favell=fscanf(fidll,'%f');

                  snr1=SNR_singlech(favelc(C_Long1:C_Long2,:),favelh(C_Long1:C_Long2,:));
                  snr2=SNR_singlech(favelc(C_Long1:C_Long2,:),favell(C_Long1:C_Long2,:));
                  snr=snr2-snr1;
                  set(handles.edit9,'string',num2str(snr1));      %填充分段信噪比
                  set(handles.edit7,'string',num2str(snr2));
                  set(handles.edit8,'string',num2str(snr));
    end

% --- Executes on button press in pushbutton2.
%    初始化键
function pushbutton2_Callback(hObject, eventdata, handles)

    global fs
    global  Long1 Long2 C_Long1 C_Long2
    C_Long1=Long1;
    C_Long2=Long2;
    fid=textread('JBMM.txt','%s','delimiter','\n');
    Name=fid{3};
    Name=num2str(Name);      %问题读入该数据时，长度为29
    %不是印象中的原式
    Name=strtrim(Name);                   %去除开头或结尾处的空格
    if strcmp(Name,'JBPJ')
         set(handles.edit16,'string','基本谱减法时域图');
    elseif strcmp(Name,'BOLL')  
        set(handles.edit16,'string','Boll改进法时域图');
    elseif strcmp(Name,'MJBPJ')  
        set(handles.edit16,'string','多窗谱估计法时域图');
    elseif strcmp(Name,'MMSE')  
        set(handles.edit16,'string','MMSE时域图');
    else
       set(handles.edit1,'string','Something Wrong!');
    end
    File_N=length(fid);
    if File_N<=3
        ensure10;
    elseif File_N>3
            F_long=str2num(strtrim((fid{4})));          %语音数据长度
            F_freq=str2num(strtrim((fid{5})));          %语音采样频率
        %     F_long=str2num(((fid{4})))          %语音数据长度
        %     F_freq=str2num(((fid{5})))          %语音采样频率     %会产生错误
            Long1=1;
        %     Long2=F_long;
        %     fclose(fid);
            set(handles.edit2,'string',num2str(F_long));                 %语音长度
            set(handles.edit3,'string',num2str(F_freq));                  %采样频率
             set(handles.edit14,'string','0');               %设置填充位为‘0’

             %计算前期信噪比 
             fidlc=fopen('cjyy.txt','r+');
             favelc=fscanf(fidlc,'%f');

             fidlh=fopen('hzyy.txt','r+');
             favelh=fscanf(fidlh,'%f');

             fidll=fopen('lbyy.txt','r+');
             favell=fscanf(fidll,'%f');

              snr1=SNR_singlech(favelc,favelh);
              snr2=SNR_singlech(favelc,favell);
              snr=snr2-snr1;
              set(handles.edit4,'string',num2str(snr1));      %填充信噪比
              set(handles.edit6,'string',num2str(snr2));
              set(handles.edit5,'string',num2str(snr));

               set(handles.edit10,'string','0');     %开始语音
               set(handles.edit11,'string','0');    %结束语音
               set(handles.edit9,'string','0');       %分段信噪比部分   SNR1
               set(handles.edit7,'string','0');         %SNR2
               set(handles.edit8,'string','0');           %SNR
               set(handles.edit15,'string','0.4');       %初始步进长度

               set(handles.edit17,'string',num2str(F_long/F_freq));       %总时长  秒(s)

        %%%%初始化绘画部分==============================
        string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
        Pname={'原始语音';'含噪语音';'滤波语音'};
        %%%%=============== 数据的等长处理
        voice1=wav_read(string_name(1));
        voice2=wav_read(string_name(2));
        voice3=wav_read(string_name(3));

        filename=fid{1};
        pathname=fid{2};
        file=[pathname filename];
        [tidy]=audioread(file);
%         disp('%数据丢失');
%         length(tidy)
%         Long2

        set(handles.edit20,'string',num2str((length(tidy)-Long2)));%数据丢失
%         length(tidy),Long2
        voice1=voice1(1:Long2);
        voice2=voice2(1:Long2);
        voice3=voice3(1:Long2);
        N=F_long;

        time=(0:N-1)/fs;
        time=time(1:Long2);              %进行语音绘画等长
        %%%%%%%%%%%==============================
        plot(handles.axes1,time,voice1);
        Plimit=max(abs(voice1));
        set(handles.edit18,'string',num2str(Plimit));
        ylim(handles.axes1,[-Plimit Plimit]);
        ylabel(handles.axes1,'振幅'); xlabel(handles.axes1,'时间/s');
        % xlim(handles.axes1,[1 2]);
        title(handles.axes1,[char(Pname(1)),'时域图']);

        plot(handles.axes2,time,voice2);
        ylabel(handles.axes2,'振幅'); xlabel(handles.axes2,'时间/s');
        title(handles.axes2,[char(Pname(2)),'时域图']);
        ylim(handles.axes2,[-Plimit Plimit]);

        plot(handles.axes3,time,voice3);
        ylabel(handles.axes3,'振幅'); xlabel(handles.axes3,'时间/s');
        title(handles.axes3,[char(Pname(3)),'时域图']);
        ylim(handles.axes3,[-Plimit Plimit]);
    end
            

function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
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

function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
%  步进键
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Cfactor1=str2num(get(handles.edit10,'string')) ;   % 开始语音
    Cfactor2=str2num(get(handles.edit11,'string')) ;   % 结束语音
    Cfactor3=str2num(get(handles.edit15,'string'))  ;  % 步进长
    Cfactor4=str2num(get(handles.edit2,'string'));    %总点数
    Cfactor5=str2num(get(handles.edit17,'string'))  ;  %总时长
    global fs
    global Long1 Long2 C_Long1 C_Long2
    C_Long1=Long1;
    C_Long2=Long2;
    cc=0;
    ktt=0;%等于零默认为输入的为点数 ktt=1 ；默认为输入时间 
    tmd=0;%用于决定绘画是否正确进行，对计算信噪比提供依据
    Cfactor_P(1)=Jnum(Cfactor1);                                %仅仅是为了改变错误数据
   
    if ~Cfactor_P(1)   
        set(handles.edit21,'string','0');
    end
    Cfactor_P(2)=Jnum(Cfactor2);
    if ~Cfactor_P(2)   
        set(handles.edit22,'string','0');
    end
    Cfactor_P(3)=Jnum(Cfactor3);           %帧移比
    if ~Cfactor_P(3)   
        set(handles.edit19,'string','0')
    end
    if sum(Cfactor_P)~=3
        ensure4;cc=1;      disp('sum(Cfactor_P)~=3')
    end
    if Cfactor1>Cfactor2                          %进行初步的逻辑判断
        ensure7;cc=1;                                %数据输入错误
        set(handles.edit10,'string','0');                %设置信息数据；
        set(handles.edit11,'string','0');                %
    end
    
%     Cfactor1=str2num(get(handles.edit10,'string')) ;   % 开始语音
%     Cfactor2=str2num(get(handles.edit11,'string')) ;   % 结束语音
%     Cfactor3=str2num(get(handles.edit15,'string'))  ;  % 步进长
%     Cfactor4=str2num(get(handles.edit2,'string'));    %总点数
%     Cfactor5=str2num(get(handles.edit17,'string'))  ;  %总时长
    
    if cc==0
        kcc=str2num(get(handles.edit14,'string')); %判定是否为第一次
        if Cfactor2>Cfactor5                    %先判断输入的是点数还是时间
            Long1_time=Cfactor1/fs;
            Long2_time=Cfactor2/fs;
            ktt=1; 
            if kcc==0
                ensure8;                                    %判定输入为时间
            end 
            disp('数据转换为时间！')
        else
            Long1_time=Cfactor1;
            Long2_time=Cfactor2;
            disp('正常输入')
        end
 %%%%=====================================================      
            Plimit=str2num(get(handles.edit18,'string')) ;
        if kcc==0                              %第一次直接进行步进
            Long1_time=Long1_time+Cfactor3;
            Long2_time=Long2_time+Cfactor3;
            if (Long2_time>Cfactor5)  && (Long2_time>Long1_time)
                ensure4;
                Long1_time=Long1_time-(Long2_time-Cfactor5);
                Long2_time=Cfactor5;
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]);       
                tmd=1;
                disp('(Long2_time>Cfactor5)  & (Long2_time>Long1_time)0')
            elseif (Long1_time<0)  && (Long2_time<Cfactor5)
                ensure4;
                Long1_time=0;
                Long2_time=Long2_time-abs(Long1_time)+abs(Cfactor3);
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]); 
                tmd=1;
                disp('(Long1_time<0)  & (Long2_time<Cfactor5)0')
            elseif (Long1_time>0) && (Long2_time<Cfactor5) && (Long2_time>Long1_time)
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]); 
                tmd=1;
                disp('Long1_time>0 & Long2_time<Cfactor5 & Long2_time>Long1_time0')
            else
                disp('TMD!');
            end
            set(handles.edit12,'string',num2str( Long1_time));
            set(handles.edit13,'string',num2str( Long2_time));
            set(handles.edit14,'string','1');
        end
%%%%=======================================================        
        if kcc==1                     %进行正常绘画的一部分   ； 连续性绘画
            Long1_time=str2num(get(handles.edit12,'string'));
            Long2_time=str2num(get(handles.edit13,'string'));
            Long1_time=Long1_time+Cfactor3;
            Long2_time=Long2_time+Cfactor3;
            if (Long2_time>Cfactor5)  && (Long2_time>Long1_time)
                ensure4;
                Long1_time=Long1_time-(Long2_time-Cfactor5);
                Long2_time=Cfactor5;
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]);     
                tmd=1;
                disp('(Long2_time>Cfactor5)  & (Long2_time>Long1_time)1')
            elseif (Long1_time<0)  && (Long2_time<Cfactor5)
                ensure4;
                Long1_time=0;
                Long2_time=Long2_time-abs(Long1_time)+abs(Cfactor3);
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]); 
                tmd=1;
                disp('(Long1_time<0)  & (Long2_time<Cfactor5)1')
            elseif (Long1_time>=0) && (Long2_time<=Cfactor5) && (Long2_time>Long1_time)
                axis(handles.axes1,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes2,[Long1_time Long2_time -Plimit Plimit]);
                axis(handles.axes3,[Long1_time Long2_time -Plimit Plimit]);
                tmd=1;
                disp('(Long1_time>0 & Long2_time<Cfactor5 & Long2_time>Long1_time)1');
            else
                disp('TMD!');
            end
            set(handles.edit12,'string',num2str( Long1_time)); %前两个是时间取舍的设计
            set(handles.edit13,'string',num2str( Long2_time));            
        end       

        %%%%语音信噪比计算部分
        if tmd==1
            if ktt==1               
                set(handles.edit10,'string',num2str( ceil(Long1_time*fs)));                %设置信息数据；
                set(handles.edit11,'string',num2str( fix(Long2_time*fs)));                %
            else
                if Long1_time<0.000000000001
                    set(handles.edit10,'string','0');                %设置信息数据；
                else
                    set(handles.edit10,'string',num2str( Long1_time));
                end
                set(handles.edit11,'string',num2str( Long2_time));                %
            end
            if Long1_time==0                    %数据信息的提取
                C_Long1=1;
                C_Long2=fix(Long2_time*fs);
            else
                C_Long1=ceil(Long1_time*fs);
                C_Long2=fix(Long2_time*fs);
            end
  %%% %%==============分段信噪比计算
           if C_Long1==0
               C_Long1=1;
           end
                 fidlc=fopen('cjyy.txt','r+');
                 favelc=fscanf(fidlc,'%f');

                 fidlh=fopen('hzyy.txt','r+');
                 favelh=fscanf(fidlh,'%f');

                 fidll=fopen('lbyy.txt','r+');
                 favell=fscanf(fidll,'%f');
                 C_Long1 
                 C_Long2
%                  size(Long1)
%                  size(Long2)                         %这里存在数据不对等问题
                  favelc_L=length(favelc) 
%                   size(favelh)
                  if C_Long2>favelc_L
                      C_Long2=favelc_L;
                  elseif C_Long1>C_Long2
                      C_Long1=C_Long2-1;
                  end
                  snr1=SNR_singlech(favelc(C_Long1:C_Long2,:),favelh(C_Long1:C_Long2,:));
                  snr2=SNR_singlech(favelc(C_Long1:C_Long2,:),favell(C_Long1:C_Long2,:));
                  snr=snr2-snr1;
                  set(handles.edit9,'string',num2str(snr1));      %填充分段信噪比
                  set(handles.edit7,'string',num2str(snr2));
                  set(handles.edit8,'string',num2str(snr));
        end
    end
    
function edit15_Callback(hObject, eventdata, handles)

function edit15_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit17_Callback(hObject, eventdata, handles)

function edit17_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit18_Callback(hObject, eventdata, handles)
function edit18_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
%试听当前语音列表。
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
%播放   试听当前语音键
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global APK2 scc;             % disp('播放键');
APK2=get(handles.popupmenu2,'value')
scc=1;
wav_play;              %判断条件全都在里面


function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
