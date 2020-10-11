function varargout = fa44(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fa44_OpeningFcn, ...
                   'gui_OutputFcn',  @fa44_OutputFcn, ...
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


% --- Executes just before fa44 is made visible.
function fa44_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


function varargout = fa44_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on selection change in popupmenu1.
function popupmenu2_Callback(hObject, eventdata, handles)
global APK2;               %保存键
APK2=get(hObject,'value');

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
%播放
function popupmenu1_Callback(hObject, eventdata, handles)
global APK1;               %播放键
APK1=get(hObject,'value');

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*
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

function pushbutton3_Callback(hObject, eventdata, handles)
%绘画语谱图；
global Cfactor3 Cfactor5
Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
wav_printLSp(Cfactor3,Cfactor5);
run('LSP');

%主文件
function pushbutton4_Callback(hObject, eventdata, handles)
    global  fs scc;
    global APK1;           %保存键
    APK1=get(handles.popupmenu1,'value');
    global APK2;          %播放键
    APK2=get(handles.popupmenu2,'value');
    global  kk;
   kk=0;        
   global Long1 Long2;
   Long1=1;Long2=0;
   %不知道为何，每一次按住‘语谱图’，函数
   %文件都会从新再写入一遍文件的基本信息。
F_path=dir('JBMM.txt');
if F_path.bytes==0            %判断文件输入是否为空
    ensure2;
    set(handles.edit9,'string','');
else
    tic;scc=0;
    fid=textread('JBMM.txt','%s','delimiter','\n');
    filename=fid{1};
    pathname=fid{2};
    file=[pathname filename];
    [tidy,fs]=audioread(file);
    tidy=tidy';
%     disp('N_I')
%     N_l=length(tidy)
%     Long2=N_l;
    Cfactor1=str2num(get(handles.edit1,'string'));       %  系数 A ：
    Cfactor2=str2num(get(handles.edit2,'string'));       %  语音存在概率：
    Cfactor3=str2num(get(handles.edit3,'string'));       %  叠加信噪比
    Cfactor4=str2num(get(handles.edit4,'string'));       %  帧移比
    Cfactor5=str2num(get(handles.edit5,'string'));       %  帧长
    Cfactor_B=[0.98 0.2 10 0.5 256];

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
%     Cfactor1=str2num(get(handles.edit1,'string'));       %  系数 A ：
%     Cfactor2=str2num(get(handles.edit2,'string'));       %  语音存在概率：
%     Cfactor3=str2num(get(handles.edit3,'string'));       %  叠加信噪比
%     Cfactor4=str2num(get(handles.edit4,'string'));       %  帧移比
%     Cfactor5=str2num(get(handles.edit5,'string'));       %  帧长
    inc=Cfactor4;
    SNR=Cfactor3;
    wavin=Gnoisegen(tidy,SNR);
    frame_len=Cfactor5;
    step_len=inc*frame_len;           %帧移 0.5
    wav_length=length(wavin);
    R=step_len;
    L=frame_len;
    f=(wav_length-mod(wav_length,frame_len))/frame_len;%
    %因为是半帧移位，所以可行
    k=2*f-1; 
    h=sqrt(1/101.3434)*hanning(Cfactor5)';   % ??
    %汉明窗乘以系数的原因是使其复合条件要求；
    wavin=wavin(1:f*L);        %%带噪语音与纯净语音等长对其
    tidy=tidy(1:f*L);                %这里会导致数据存入的长度与与原始语音长度
    win=zeros(1,f*L);        %发生改变
    enspeech=zeros(1,f*L);
    for r=1:k
        y=wavin(1+(r-1)*R:L+(r-1)*R);      %感觉像是一段一段进行计算
        y=y.*h;               %加窗                       %   ???????????? 问题
        w=fft(y);
        Y(1+(r-1)*L:r*L)=w(1:L);
    end
    %噪声估计是干啥的？？
    NOISE=stationary_noise_evaluate(Y,L,k);
    %返回的是噪声估计值的平方，功率
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%    MMSE
    for b=1:L         %帧长
        a=Cfactor1;       %系数
        q=Cfactor2;         %第 k 个频率分量的语音存在概率
        A=[0.1*abs(Y(b)),zeros(1,k-1)];  %语音幅度  
        sl=[a*abs(Y(b)).^2/NOISE(b),zeros(1,k-1)];   %先验信噪比
        %这里为啥只算了一个 Y(b) ?
        for t=1:k-1;                  % k 帧数
            xl(t+1)=abs(Y(b+t*L)).^2;  % k-1 与 t+1 的差别
            r(t+1)=xl(t+1)/NOISE(b+t*L);   %后验信噪比 
            
            if r(t+1) >= 700
                r(t+1)=700;
            elseif r(t+1)<1
                r(t+1)=1.5;
            end       
            
            sl(t+1)=a*(A(t).^2/NOISE(b+(t-1)*L)) +(1-a)*max(r(t+1)-1,0);
            %先验信噪比           这里的 t 为何是这个，没有变化       
            v(t+1)=(sl(t+1)/(1+sl(t+1)))*r(t+1);      
            if v(t+1)<0.1
                expint(t+1)=-2.31*log10(v(t+1))-0.6;
            elseif v(t+1)>=0.1 & v(t+1)<=1
                expint(t+1)=-1.544*log10(v(t+1))+0.166;
            elseif v(t+1)>1
                expint(t+1)=10.^(-0.52*(v(t+1))-0.26);
            end

          Gmmse(t+1)=(sl(t+1)/(1+sl(t+1)))*exp(0.5*expint(t+1));
          w(t+1)=((1-q)/q)*(exp(v(t+1))/(1+sl(t+1)));
          A(t+1)=(w(t+1)/(1+w(t+1)))*Gmmse(t+1)*abs(Y(b+t*L));
        end                                                              %  R(k)     
             %用当前的去判断下一个，再用下一个得到下一个
        A1(1+(b-1)*k:b*k)=A(1:k);   %估计完成后进行从新分配
    end

    for t1=1:k               %总帧数
        for j=1:L             %总帧长
            d(j)=A1(t1+(j-1)*k);   %提取的
        end
        A2(1+(t1-1)*L:t1*L)=d(1:L);
    end

    for t2=1:k
        S=A2(1+(t2-1)*L:t2*L);
        ang=Y(1+(t2-1)*L:t2*L)./abs(Y(1+(t2-1)*L:t2*L));
        S=S.*ang;
        s=ifft(S);
        s=real(s);
        enspeech(1+(t2-1)*L/2:L+(t2-1)*L/2)=enspeech(1+(t2-1)*L/2:L+(t2-1)*L/2)+s;

        win(1+(t2-1)*L/2:L+(t2-1)*L/2)=win(1+(t2-1)*L/2:L+(t2-1)*L/2)+h;
    end

    %%%%%%%%%%%绘图
        enspeech=enspeech./win;          %去除加窗引起的增益
        Long2=length(tidy);
        snr1=SNR_singlech(tidy,wavin);            % 计算初始信噪比
        snr2=SNR_singlech(tidy,enspeech);            % 计算谱减后的信噪比
        snr=snr2-snr1;
        set(handles.edit6,'string',num2str(snr1));
        set(handles.edit8,'string',num2str(snr2));
        set(handles.edit7,'string',num2str(snr));

        string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
        plot(handles.axes1,tidy);title(handles.axes1,'(a)原始语音');
        xlabel(handles.axes1,'样点数');ylabel(handles.axes1,'幅度');
        ylim(handles.axes1,[-max(tidy) max(tidy)]);
        wavsave(string_name(1),tidy);            
        %保存 txt 文件。
        plot(handles.axes2,wavin);title(handles.axes2,['(b)带噪语音(',num2str(SNR),' dB白噪声)']);
        xlabel(handles.axes2,'样点数');ylabel(handles.axes2,'幅度');
        ylim(handles.axes2,[-max(wavin) max(wavin)]);
        wavsave(string_name(2),wavin);

        plot(handles.axes3,enspeech);title(handles.axes3,'(c)增强语音');
        xlabel(handles.axes3,'样点数');ylabel(handles.axes3,'幅度');
        ylim(handles.axes3,[-max(wavin) max(wavin)]);
        wavsave(string_name(3),enspeech);
        RunTime=toc;
   	    set(handles.edit10,'string',num2str(RunTime));
        wav_play; 
        
        
        xncc=str2num(get(handles.edit11,'string')); 
        %确保存入的信息只存入一次
        if xncc==0
        %%%%%==============   保存基本信息       
            fidl=fopen('JBMM.txt','r+'); 
            fseek(fidl,0,'eof');
            fprintf(fidl,'%d\r\n',Long2);         %语音长度
            fprintf(fidl,'%d\r\n',fs);        %语音频率
            fprintf(fidl,'%d\r\n',fs/2);
            fclose(fidl);
            set(handles.edit11,'string','1');
        end
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
wav_printSZerosP(Cfactor3,Cfactor5)


function pushbutton6_Callback(hObject, eventdata, handles)
%选择语音
[filename pathname]=uigetfile('*.wav');
fid=fopen('JBMM.txt','wt');
[filer filec]=size(filename);
[pathr pathc]=size(pathname);
if filer==1 & filec<=4 & pathr==1 & pathc==1
    ensure2;
else
    filec=num2str(filec);
    pathc=num2str(pathc);
    target={filename;pathname;num2str('MMSE')};
    set(handles.edit9,'string',pathname);              %保存的路径
    str=str2mat(target);     %将字符串单元数组转化为字符数组；
    %%%%%*****************************
    format=[repmat('%c',1,size(str,2)),'\n'];%生成格式字符串；
    %size(a,2) 存入时，是以最大的字符串格式存入的
    fprintf(fid,format,str');
    set(handles.edit11,'string','0');
end

% --- Executes on button press in pushbutton7.

function pushbutton7_Callback(hObject, eventdata, handles)
cc=imread('MMSE2.jpg');
figure(5);
imshow(cc);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('确定退出','退出','YES','NO','YES');
if strcmp(button,'YES')
    close('fa44');Clear_File;
    run('Fdegree');
elseif strcmp(button,'NO')
    return;
end

% disp('播放键');
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
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %语音数据长度
Long2=F_long;
scc=0;
wav_KBoardsave();                  %保存文件？

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
% hObject    handle to lc3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('DPTT');



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.

function pushbutton10_Callback(hObject, eventdata, handles)
%%% 短时能量图
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cfactor3=str2num(get(handles.edit4,'string'));       %  帧移比
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  帧长
Cfactor3=Cfactor5*Cfactor3;
Power_calculate(Cfactor5,Cfactor3)
%%%%


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Clear_File;
