function varargout = fa33(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fa33_OpeningFcn, ...
                   'gui_OutputFcn',  @fa33_OutputFcn, ...
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

function fa33_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = fa33_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%查看流程图
function pushbutton7_Callback(hObject, eventdata, handles)
cc=imread('dcpgjpjf.jpg');
figure(5);
imshow(cc);

%退出键
function pushbutton8_Callback(hObject, eventdata, handles)
button=questdlg('确定退出','退出','YES','NO','YES');
if strcmp(button,'YES')
    close('fa33');
    Clear_File;
    run('Fdegree');
    clear APK1;
    clear APK2;
elseif strcmp(button,'NO')
    return;
end


function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%选择文件
function pushbutton6_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile('*.wav');
fid=fopen('JBMM.txt','wt');
[filer filec]=size(filename);
[pathr pathc]=size(pathname);
if filer==1 & filec<=4 & pathr==1 & pathc==1
    ensure2;
else
    filec=num2str(filec);
    pathc=num2str(pathc);

    target={filename;pathname;'MJBPJ'};
    set(handles.edit9,'string',pathname);              %保存的路径
    str=str2mat(target);     %将字符串单元数组转化为字符数组；
    %%%%%*****************************
    format=[repmat('%c',1,size(str,2)),'\n'];%生成格式字符串；
    %size(a,2) 存入时，是以最大的字符串格式存入的
    fprintf(fid,format,str');
        set(handles.edit12,'string','0');
end

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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

%语谱图
function pushbutton3_Callback(hObject, eventdata, handles)
% Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
% Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
% wav_printLSp(Cfactor3,Cfactor5)
global Cfactor3 Cfactor5
Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
wav_printLSp(Cfactor3,Cfactor5);
run('LSP');

%运行语音
function pushbutton4_Callback(hObject, eventdata, handles)
global APK2;             % disp('播放键');
APK2=get(handles.popupmenu2,'value');
global APK1;            % disp('保存键');
APK1=get(handles.popupmenu1,'value');
global  kk scc;
   kk=0;
   global Long1 Long2;
   Long1=1;Long2=0; 
F_path=dir('JBMM.txt');
if F_path.bytes==0            %判断文件输入是否为空
    ensure2;
    set(handles.edit9,'string','');
else
    APK3=get(handles.popupmenu3,'value');
    %c=0时,用功率谱计算增益矩阵不进行开方运算,c=1时,进行开方运算 
    tic;scc=0;
    fid=textread('JBMM.txt','%s','delimiter','\n');
    global  fs ;
    filename=fid{1};
    pathname=fid{2};
    file=[pathname filename];
    switch APK3
        case 1
            c=1;
        case 2
            c=0;
        otherwise
            disp('TMD!');
    end

    Cfactor1=str2num(get(handles.edit1,'string'));       %  系数 A ：
    Cfactor2=str2num(get(handles.edit2,'string'));       %  语音存在概率：
    Cfactor3=str2num(get(handles.edit3,'string'));       %  叠加信噪比
    Cfactor4=str2num(get(handles.edit4,'string'));       %  帧移比
    Cfactor5=str2num(get(handles.edit5,'string'));       %  帧长
    Cfactor_B=[2.8 0.001 10 0.5 200];

    Cfactor_P(1)=Jnum(Cfactor1);                                %仅仅是为了改变错误数据
    if ~Cfactor_P(1)   
        set(handles.edit1,'string',num2str(Cfactor_B(1)));
        Cfactor1=Cfactor_B(1);
    end
    Cfactor_P(2)=Jnum(Cfactor2);
    if ~Cfactor_P(2)   
        set(handles.edit2,'string',num2str(Cfactor_B(2)));
        Cfactor2=Cfactor_B(2);
    end
    Cfactor_P(3)=Jnum(Cfactor3);           %帧移比
    if ~Cfactor_P(3)   
        set(handles.edit3,'string',num2str(Cfactor_B(3)))
        Cfactor3=Cfactor_B(3);
    end
    Cfactor_P(4)=Jnum(Cfactor4);
    if ~Cfactor_P(4)   
        set(handles.edit4,'string',num2str(Cfactor_B(4)))
        Cfactor4=Cfactor_B(4);
    end
    Cfactor_P(5)=Jnum(Cfactor5);
    if ~Cfactor_P(5)   
        set(handles.edit5,'string',num2str(Cfactor_B(5)))
        Cfactor5=Cfactor_B(5);
    end

    Cfactor_P=sum(Cfactor_P);
    if Cfactor_P~=5            %弹出因子设置出错框口
        ensure1;
    end

    [xx,fs]=audioread(file);                   % 读入数据文件
    xx=xx-mean(xx);                         % 消除直流分量
    x=xx/max(abs(xx));                      % 幅值归一化
    SNR=Cfactor3;                                  % 设置初始信噪比
    [signal]=Gnoisegen(x,SNR);           % 叠加噪声
    snr1=SNR_singlech(x,signal);            % 计算叠加噪后的信噪比
    IS=0.15;                                % 前导无话段长度(s)

    alpha=Cfactor1;                              % 过减因子
    beta=Cfactor2;                             % 增益补偿因子

    N=length(signal);                       % 信号长度
%     N_l=N;
    time=(0:N-1)/fs;                        % 设置时间
    wlen=Cfactor5;                               % 设置帧长
    inc=Cfactor4*wlen;                                 % 设置帧移
    NIS=fix((IS*fs-wlen)/inc +1);           % 前导无话段帧数

    output=Mtmpsd_ssb(signal,wlen,inc,NIS,alpha,beta,c);% 多窗谱改进谱减法减噪处理
    snr2=SNR_singlech(x,output);            % 计算谱减后的信噪比
    snr=snr2-snr1;

    string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
    set(handles.edit6,'string',num2str(snr1));
    set(handles.edit8,'string',num2str(snr2));
    set(handles.edit7,'string',num2str(snr));

    plot(handles.axes1,time,x,'b'); 
    title(handles.axes1,'纯语音波形'); ylabel(handles.axes1,'幅值');
    xlabel(handles.axes1,'时间/s');ylim(handles.axes1,[-1 1]);
    wavsave(string_name(1),x);

    plot(handles.axes2,time,signal,'b'); 
    title(handles.axes2,['带噪语音 信噪比=' num2str(SNR) ' dB']); ylabel(handles.axes2,'幅值')
    xlabel(handles.axes2,'时间/s');ylim(handles.axes2,[-1 1]);
    wavsave(string_name(2),signal);

     plot(handles.axes3,time,output,'b');
    title(handles.axes3,'增强后波形'); ylabel(handles.axes3,'幅值');
    xlabel(handles.axes3,'时间/s');ylim(handles.axes3,[-1 1]);
    wavsave(string_name(3),output);
    RunTime=toc;
    set(handles.edit10,'string',num2str(RunTime));
    % disp(RunTime);
    Long2=length(output);
    wav_play;
        xncc=str2num(get(handles.edit12,'string')); 
%         xncc
        %确保存入的信息只存入一次
        if xncc==0
        %%%%%==============   保存基本信息       
            fidl=fopen('JBMM.txt','r+'); 
            fseek(fidl,0,'eof');
            fprintf(fidl,'%d\r\n',Long2);         %语音长度
            fprintf(fidl,'%d\r\n',fs);        %语音频率
            fprintf(fidl,'%d\r\n',fs/2);
            fclose(fidl);
            set(handles.edit12,'string','1');
        end
end

%短时平均过零率
function pushbutton5_Callback(hObject, eventdata, handles)
Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
wav_printSZerosP(Cfactor3,Cfactor5)

function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%播放键
function pushbutton1_Callback(hObject, eventdata, handles)
global APK2;             % disp('播放键');
APK2=get(handles.popupmenu2,'value')
global Long1 Long2 scc
Long1=1;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %语音数据长度
Long2=F_long;
scc=0;
wav_play;              %判断条件全都在里面

%保存键
function pushbutton2_Callback(hObject, eventdata, handles)
global Long1 Long2 scc
Long1=1;
global APK1;             % disp('保存键');
APK1=get(handles.popupmenu1,'value')
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %语音数据长度
Long2=F_long;
scc=0;
wav_KBoardsave();

%选择是对增益因式开方1 还是不开放 2
function popupmenu3_Callback(hObject, eventdata, handles)
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function cd1_Callback(hObject, eventdata, handles)
% hObject    handle to cd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cd2_Callback(hObject, eventdata, handles)
% hObject    handle to cd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cd3_Callback(hObject, eventdata, handles)
% hObject    handle to cd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cd6_Callback(hObject, eventdata, handles)
% hObject    handle to cd6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cd4_Callback(hObject, eventdata, handles)
% hObject    handle to cd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cd5_Callback(hObject, eventdata, handles)
% hObject    handle to cd5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sm1_Callback(hObject, eventdata, handles)
% hObject    handle to sm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sm2_Callback(hObject, eventdata, handles)
% hObject    handle to sm2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sm3_Callback(hObject, eventdata, handles)
% hObject    handle to sm3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sm4_Callback(hObject, eventdata, handles)
% hObject    handle to sm4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lc1_Callback(hObject, eventdata, handles)
% hObject    handle to lc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lc2_Callback(hObject, eventdata, handles)
% hObject    handle to lc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lc3_Callback(hObject, eventdata, handles)

function pushbutton9_Callback(hObject, eventdata, handles)
run('DPTT');



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
%%%能量图
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Cfactor3=str2num(get(handles.edit1,'string'));       %  帧移比
% Cfactor5=str2num(get(handles.edit9,'string'));       %  帧长
Cfactor4=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string'));       %  帧长
Cfactor4=Cfactor5*Cfactor4;
Power_calculate(Cfactor5,Cfactor4)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Clear_File;
