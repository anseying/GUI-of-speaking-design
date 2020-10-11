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
global APK2;               %�����
APK2=get(hObject,'value');

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
%����
function popupmenu1_Callback(hObject, eventdata, handles)
global APK1;               %���ż�
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
%�滭����ͼ��
global Cfactor3 Cfactor5
Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��
wav_printLSp(Cfactor3,Cfactor5);
run('LSP');

%���ļ�
function pushbutton4_Callback(hObject, eventdata, handles)
    global  fs scc;
    global APK1;           %�����
    APK1=get(handles.popupmenu1,'value');
    global APK2;          %���ż�
    APK2=get(handles.popupmenu2,'value');
    global  kk;
   kk=0;        
   global Long1 Long2;
   Long1=1;Long2=0;
   %��֪��Ϊ�Σ�ÿһ�ΰ�ס������ͼ��������
   %�ļ����������д��һ���ļ��Ļ�����Ϣ��
F_path=dir('JBMM.txt');
if F_path.bytes==0            %�ж��ļ������Ƿ�Ϊ��
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
    Cfactor1=str2num(get(handles.edit1,'string'));       %  ϵ�� A ��
    Cfactor2=str2num(get(handles.edit2,'string'));       %  �������ڸ��ʣ�
    Cfactor3=str2num(get(handles.edit3,'string'));       %  ���������
    Cfactor4=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
    Cfactor5=str2num(get(handles.edit5,'string'));       %  ֡��
    Cfactor_B=[0.98 0.2 10 0.5 256];

    Cfactor_P(1)=Jnum(Cfactor1);                                %������Ϊ�˸ı��������
    if ~Cfactor_P(1)   
        set(handles.edit1,'string',num2str(Cfactor_B(1)));
        Cfactor1=Cfactor_B(1);
    end
    Cfactor_P(2)=Jnum(Cfactor2);
    if ~Cfactor_P(2)   
        set(handles.edit2,'string',num2str(Cfactor_B(2)));
        Cfactor2=Cfactor_B(2);
    end
    Cfactor_P(3)=Jnum(Cfactor3);           %֡�Ʊ�
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
    if Cfactor_P~=5            %�����������ó�����
        ensure1;
    end
%     Cfactor1=str2num(get(handles.edit1,'string'));       %  ϵ�� A ��
%     Cfactor2=str2num(get(handles.edit2,'string'));       %  �������ڸ��ʣ�
%     Cfactor3=str2num(get(handles.edit3,'string'));       %  ���������
%     Cfactor4=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
%     Cfactor5=str2num(get(handles.edit5,'string'));       %  ֡��
    inc=Cfactor4;
    SNR=Cfactor3;
    wavin=Gnoisegen(tidy,SNR);
    frame_len=Cfactor5;
    step_len=inc*frame_len;           %֡�� 0.5
    wav_length=length(wavin);
    R=step_len;
    L=frame_len;
    f=(wav_length-mod(wav_length,frame_len))/frame_len;%
    %��Ϊ�ǰ�֡��λ�����Կ���
    k=2*f-1; 
    h=sqrt(1/101.3434)*hanning(Cfactor5)';   % ??
    %����������ϵ����ԭ����ʹ�临������Ҫ��
    wavin=wavin(1:f*L);        %%���������봿�������ȳ�����
    tidy=tidy(1:f*L);                %����ᵼ�����ݴ���ĳ�������ԭʼ��������
    win=zeros(1,f*L);        %�����ı�
    enspeech=zeros(1,f*L);
    for r=1:k
        y=wavin(1+(r-1)*R:L+(r-1)*R);      %�о�����һ��һ�ν��м���
        y=y.*h;               %�Ӵ�                       %   ???????????? ����
        w=fft(y);
        Y(1+(r-1)*L:r*L)=w(1:L);
    end
    %���������Ǹ�ɶ�ģ���
    NOISE=stationary_noise_evaluate(Y,L,k);
    %���ص�����������ֵ��ƽ��������
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%    MMSE
    for b=1:L         %֡��
        a=Cfactor1;       %ϵ��
        q=Cfactor2;         %�� k ��Ƶ�ʷ������������ڸ���
        A=[0.1*abs(Y(b)),zeros(1,k-1)];  %��������  
        sl=[a*abs(Y(b)).^2/NOISE(b),zeros(1,k-1)];   %���������
        %����Ϊɶֻ����һ�� Y(b) ?
        for t=1:k-1;                  % k ֡��
            xl(t+1)=abs(Y(b+t*L)).^2;  % k-1 �� t+1 �Ĳ��
            r(t+1)=xl(t+1)/NOISE(b+t*L);   %��������� 
            
            if r(t+1) >= 700
                r(t+1)=700;
            elseif r(t+1)<1
                r(t+1)=1.5;
            end       
            
            sl(t+1)=a*(A(t).^2/NOISE(b+(t-1)*L)) +(1-a)*max(r(t+1)-1,0);
            %���������           ����� t Ϊ���������û�б仯       
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
             %�õ�ǰ��ȥ�ж���һ����������һ���õ���һ��
        A1(1+(b-1)*k:b*k)=A(1:k);   %������ɺ���д��·���
    end

    for t1=1:k               %��֡��
        for j=1:L             %��֡��
            d(j)=A1(t1+(j-1)*k);   %��ȡ��
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

    %%%%%%%%%%%��ͼ
        enspeech=enspeech./win;          %ȥ���Ӵ����������
        Long2=length(tidy);
        snr1=SNR_singlech(tidy,wavin);            % �����ʼ�����
        snr2=SNR_singlech(tidy,enspeech);            % �����׼���������
        snr=snr2-snr1;
        set(handles.edit6,'string',num2str(snr1));
        set(handles.edit8,'string',num2str(snr2));
        set(handles.edit7,'string',num2str(snr));

        string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
        plot(handles.axes1,tidy);title(handles.axes1,'(a)ԭʼ����');
        xlabel(handles.axes1,'������');ylabel(handles.axes1,'����');
        ylim(handles.axes1,[-max(tidy) max(tidy)]);
        wavsave(string_name(1),tidy);            
        %���� txt �ļ���
        plot(handles.axes2,wavin);title(handles.axes2,['(b)��������(',num2str(SNR),' dB������)']);
        xlabel(handles.axes2,'������');ylabel(handles.axes2,'����');
        ylim(handles.axes2,[-max(wavin) max(wavin)]);
        wavsave(string_name(2),wavin);

        plot(handles.axes3,enspeech);title(handles.axes3,'(c)��ǿ����');
        xlabel(handles.axes3,'������');ylabel(handles.axes3,'����');
        ylim(handles.axes3,[-max(wavin) max(wavin)]);
        wavsave(string_name(3),enspeech);
        RunTime=toc;
   	    set(handles.edit10,'string',num2str(RunTime));
        wav_play; 
        
        
        xncc=str2num(get(handles.edit11,'string')); 
        %ȷ���������Ϣֻ����һ��
        if xncc==0
        %%%%%==============   ���������Ϣ       
            fidl=fopen('JBMM.txt','r+'); 
            fseek(fidl,0,'eof');
            fprintf(fidl,'%d\r\n',Long2);         %��������
            fprintf(fidl,'%d\r\n',fs);        %����Ƶ��
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
Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��
wav_printSZerosP(Cfactor3,Cfactor5)


function pushbutton6_Callback(hObject, eventdata, handles)
%ѡ������
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
    set(handles.edit9,'string',pathname);              %�����·��
    str=str2mat(target);     %���ַ�����Ԫ����ת��Ϊ�ַ����飻
    %%%%%*****************************
    format=[repmat('%c',1,size(str,2)),'\n'];%���ɸ�ʽ�ַ�����
    %size(a,2) ����ʱ�����������ַ�����ʽ�����
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
button=questdlg('ȷ���˳�','�˳�','YES','NO','YES');
if strcmp(button,'YES')
    close('fa44');Clear_File;
    run('Fdegree');
elseif strcmp(button,'NO')
    return;
end

% disp('���ż�');
function pushbutton1_Callback(hObject, eventdata, handles)
global APK2;             % disp('���ż�');
APK2=get(handles.popupmenu2,'value')
global Long1 Long2 scc
Long1=1;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %�������ݳ���
Long2=F_long;
scc=0;
wav_play;              %�ж�����ȫ��������

%�����
function pushbutton2_Callback(hObject, eventdata, handles)
global Long1 Long2 scc
Long1=1;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %�������ݳ���
Long2=F_long;
scc=0;
wav_KBoardsave();                  %�����ļ���

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
%%% ��ʱ����ͼ
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��
Cfactor3=Cfactor5*Cfactor3;
Power_calculate(Cfactor5,Cfactor3)
%%%%


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Clear_File;
