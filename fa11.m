function varargout = untitled(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
%%�����

function pushbutton1_Callback(hObject, eventdata, handles)
global Long1 Long2 scc
Long1=1;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %�������ݳ���
Long2=F_long;
scc=0;
wav_KBoardsave();

%   ѡ���ź��ļ�   
function pushbutton2_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile('*.wav');
fid=fopen('JBMM.txt','wt');
[filer filec]=size(filename)
[pathr pathc]=size(pathname)
if filer==1 & filec<=4 & pathr==1 & pathc==1
    ensure2;
else
    filec=num2str(filec);
    pathc=num2str(pathc);

    target={filename;pathname;'JBPJ'};
    set(handles.edit3,'string',pathname);              %�����·��
    str=str2mat(target);     %���ַ�����Ԫ����ת��Ϊ�ַ����飻
    %%%%%*****************************
    format=[repmat('%c',1,size(str,2)),'\n'];%���ɸ�ʽ�ַ�����
    %size(a,2) ����ʱ�����������ַ�����ʽ�����
    fprintf(fid,format,str');
        set(handles.edit12,'string','0');
end

% --- Executes on button press in pushbutton3.
%%���ż�

function pushbutton3_Callback(hObject, eventdata, handles)
global Long1 Long2 scc
Long1=1;
fid=textread('JBMM.txt','%s','delimiter','\n');
F_long=str2num(strtrim((fid{4})));          %�������ݳ���
Long2
Long2=F_long;
global APK2;             % disp('���ż�');
APK2=get(handles.popupmenu2,'value')
scc=0;
wav_play;              %�ж�����ȫ��������

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
button=questdlg('ȷ���˳�','�˳�','YES','NO','YES');
if strcmp(button,'YES')
    close('fa11');Clear_File;
    run('Fdegree');
elseif strcmp(button,'NO')
    return;
end


% --- Executes on button press in pushbutton5.
%  ����ͼ�Ļ滭       
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
% Cfactor5=str2num(get(handles.edit9,'string')) ;      %  ֡��
% wav_printLSp(Cfactor3,Cfactor5);
global Cfactor3 Cfactor5
Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit9,'string')) ;      %  ֡��
wav_printLSp(Cfactor3,Cfactor5);
run('LSP');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global APK2;            % disp('�����');
APK2=get(handles.popupmenu2,'value')
global APK1;             % disp('���ż�');
APK1=get(handles.popupmenu1,'value')
global  kk scc;
   kk=0;
  global Long1 Long2;
   Long1=1;Long2=0; 
   F_path=dir('JBMM.txt');
if F_path.bytes==0            %�ж��ļ������Ƿ�Ϊ��
    ensure2;
    set(handles.edit3,'string','');
else
     tic;scc=0;
    fid=textread('JBMM.txt','%s','delimiter','\n');
    global  fs;
    filename=fid{1};
    pathname=fid{2};
    file=[pathname filename];
    [xx,fs]=audioread(file);     
    xx=xx-mean(xx);                         % ����ֱ������
    x=xx/max(abs(xx));                      % ��ֵ��һ��
    IS=0.31;                                % ����ǰ���޻��γ���  
    Cfactor1=str2num(get(handles.edit4,'string'));       %  ��������
    Cfactor2=str2num(get(handles.edit5,'string'));       %  ���油������
    Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
    Cfactor4=str2num(get(handles.edit2,'string')) ;      %  ���������
    Cfactor5=str2num(get(handles.edit9,'string'));       %  ֡��
    Cfactor_B=[4 0.001 0.5 10 200];

    Cfactor_P(1)=Jnum(Cfactor1);                                %������Ϊ�˸ı��������
    if ~Cfactor_P(1)   
        set(handles.edit4,'string',num2str(Cfactor_B(1)));
        Cfactor1=Cfactor_B(1);
    end
    Cfactor_P(2)=Jnum(Cfactor2);
    if ~Cfactor_P(2)   
        set(handles.edit5,'string',num2str(Cfactor_B(2)));
        Cfactor2=Cfactor_B(2);
    end
    Cfactor_P(3)=Jnum(Cfactor3);
    if ~Cfactor_P(3)   
        set(handles.edit1,'string',num2str(Cfactor_B(3)))
        Cfactor3=Cfactor_B(3);
    end
    Cfactor_P(4)=Jnum(Cfactor4);
    if ~Cfactor_P(4)   
        set(handles.edit2,'string',num2str(Cfactor_B(4)))
        Cfactor4=Cfactor_B(4);
    end
    Cfactor_P(5)=Jnum(Cfactor5);
    if ~Cfactor_P(5)   
        set(handles.edit9,'string',num2str(Cfactor_B(5)))
        Cfactor5=Cfactor_B(5);
    end

    Cfactor_P=sum(Cfactor_P);
    if Cfactor_P~=5             %�����������ó�����
        ensure1;
    end

    wlen=Cfactor5;                               % ����֡��Ϊ25ms
    inc=wlen*Cfactor3;                                 % ����֡��Ϊ10ms
    SNR=Cfactor4;                                  % ���������SNR
    N=length(x);                            % �źų���
    N_l=N;
    time=(0:N-1)/fs;                        % ����ʱ��
    signal=Gnoisegen(x,SNR);                % ��������
    snr1=SNR_singlech(x,signal);            % �����ʼ�����
    overlap=wlen-inc;                       % ���ص�������
    NIS=fix((IS*fs-wlen)/inc +1);           % ��ǰ���޻���֡��
    string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
    a=Cfactor1;b= Cfactor2;                           % ���ò���a��b
    output=Simplesubspec(signal,wlen,inc,NIS,a,b);% �׼�
    snr2=SNR_singlech(x,output);            % �����׼���������
    snr=snr2-snr1;

    % fprintf('snr1=%5.4f   snr2=%5.4f   snr=%5.4f\n',snr1,snr2,snr);

    set(handles.edit6,'string',num2str(snr1));
    set(handles.edit7,'string',num2str(snr2));
    set(handles.edit8,'string',num2str(snr));
    Long2=length(x);
    plot(handles.axes1,time,x,'b'); 
    title(handles.axes1,'����������'); ylabel(handles.axes1,'��ֵ');
    xlabel(handles.axes1,'ʱ��/s');ylim(handles.axes1,[-1 1]);
    wavsave(string_name(1),x);

    plot(handles.axes2,time,signal,'b'); 
    title(handles.axes2,['�������� �����=' num2str(SNR) ' dB']); ylabel(handles.axes2,'��ֵ')
    xlabel(handles.axes2,'ʱ��/s');ylim(handles.axes2,[-1 1]);
    wavsave(string_name(2),signal);

     plot(handles.axes3,time,output,'b');
    title(handles.axes3,'��ǿ����'); ylabel(handles.axes3,'��ֵ');
    xlabel(handles.axes3,'ʱ��/s');ylim(handles.axes3,[-1 1]);
    wavsave(string_name(3),output);
    RunTime=toc;
    set(handles.edit11,'string',num2str(RunTime));
    wav_play; 
        xncc=str2num(get(handles.edit12,'string')); 
        %ȷ���������Ϣֻ����һ��
        if xncc==0
        %%%%%==============   ���������Ϣ       
            fidl=fopen('JBMM.txt','r+'); 
            fseek(fidl,0,'eof');
            fprintf(fidl,'%d\r\n',Long2);         %��������
            fprintf(fidl,'%d\r\n',fs);        %����Ƶ��
            fprintf(fidl,'%d\r\n',fs/2);
            fclose(fidl);
            set(handles.edit12,'string','1');
        end
end
% --- Executes on selection change in popupmenu1.
% ���������
function popupmenu1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton7.
%��ʱƽ��������
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit9,'string')) ;      %  ֡��
wav_printSZerosP(Cfactor3,Cfactor5);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cc=imread('jbpjf.jpg');
figure(5);
imshow(cc);

function pushbutton9_Callback(hObject, eventdata, handles)

function pushbutton10_Callback(hObject, eventdata, handles)
run('DPTT');

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
% Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��

Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit9,'string'));       %  ֡��
Cfactor3=Cfactor5*Cfactor3;
Power_calculate(Cfactor5,Cfactor3)

function pushbutton12_Callback(hObject, eventdata, handles)
function pushbutton13_Callback(hObject, eventdata, handles)
Clear_File;

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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

function pushbutton15_Callback(hObject, eventdata, handles)
function uitable2_KeyPressFcn(hObject, eventdata, handles)

function uitable2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function uitable2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
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

function pushbutton1_CreateFcn(hObject, eventdata, handles)

function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)

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
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to sm4 (see GCBO)
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


% --------------------------------------------------------------------
function fa1_Callback(hObject, eventdata, handles)
% hObject    handle to fa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fa2_Callback(hObject, eventdata, handles)
% hObject    handle to fa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fa3_Callback(hObject, eventdata, handles)
% hObject    handle to fa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fa4_Callback(hObject, eventdata, handles)
% hObject    handle to fa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



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
