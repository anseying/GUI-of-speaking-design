function varargout = fa22(varargin)
% FA22 MATLAB code for fa22.fig
%      FA22, by itself, creates a new FA22 or raises the existing
%      singleton*.
%
%      H = FA22 returns the handle to a new FA22 or the handle to
%      the existing singleton*.
%
%      FA22('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FA22.M with the given input arguments.
%
%      FA22('Property','Value',...) creates a new FA22 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fa22_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fa22_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fa22

% Last Modified by GUIDE v2.5 06-Jun-2017 13:48:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fa22_OpeningFcn, ...
                   'gui_OutputFcn',  @fa22_OutputFcn, ...
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


% --- Executes just before fa22 is made visible.
function fa22_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fa22 (see VARARGIN)

% Choose default command line output for fa22
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fa22 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fa22_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
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
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cc=imread('MMSE1.jpg');
figure(5);
imshow(cc);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('ȷ���˳�','�˳�','YES','NO','YES');
if strcmp(button,'YES')
    close('fa22');Clear_File;
    run('Fdegree');
elseif strcmp(button,'NO')
    return;
end




function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile('*.wav');
fid=fopen('JBMM.txt','wt');
[filer filec]=size(filename);
[pathr pathc]=size(pathname);
if filer==1 & filec<=4 & pathr==1 & pathc==1
    ensure2;
else
    filec=num2str(filec);
    pathc=num2str(pathc);

    target={filename;pathname;'BOLL'};
    set(handles.edit9,'string',pathname);              %�����·��
    str=str2mat(target);     %���ַ�����Ԫ����ת��Ϊ�ַ����飻
    %%%%%*****************************
    format=[repmat('%c',1,size(str,2)),'\n'];%���ɸ�ʽ�ַ�����
    %size(a,2) ����ʱ�����������ַ�����ʽ�����
    fprintf(fid,format,str');
     set(handles.edit11,'string','0');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
% Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��
% wav_printLSp(Cfactor3,Cfactor5)
global Cfactor3 Cfactor5
Cfactor3=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit5,'string')) ;      %  ֡��
wav_printLSp(Cfactor3,Cfactor5);
run('LSP');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global  kk scc;
   kk=0; 
global APK2;             % disp('���ż�');
APK2=get(handles.popupmenu2,'value');
global APK1;            % disp('�����');
APK1=get(handles.popupmenu1,'value');
APK3=get(handles.popupmenu4,'value');
   global Long1 Long2;
   Long1=1;Long2=0;
F_path=dir('JBMM.txt');
if F_path.bytes==0            %�ж��ļ������Ƿ�Ϊ��
    ensure2;
    set(handles.edit9,'string','');
else
    tic;scc=0;
    fid=textread('JBMM.txt','%s','delimiter','\n');
    global  fs;
    filename=fid{1};
    pathname=fid{2};
    file=[pathname filename];

    switch APK3
        case 1
            c=2;             %�����׼���
        case 2
            c=1;            %��ֵ�׼���
        otherwise
            disp('TMD!');
    end

    Cfactor1=str2num(get(handles.edit1,'string'));       %  ƽ������Bata��
    Cfactor2=str2num(get(handles.edit2,'string'));       %  ����ƽ������
    Cfactor3=str2num(get(handles.edit3,'string'));       %  ���������
    Cfactor4=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
    Cfactor5=str2num(get(handles.edit5,'string'));       %  ֡��
    Cfactor_B=[0.03 9 10 0.5 256];

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

    beta=Cfactor1;Noise_L=Cfactor2
    [xx,fs]=audioread(file);                   % ���������ļ�
    xx=xx-mean(xx);                         % ����ֱ������
    x=xx/max(abs(xx));                     % ��x�� ��ֵ��һ��
    SNR=Cfactor3;                                    % ���������
    signal=Gnoisegen(x,SNR);                 % ��signal����������
    snr1=SNR_singlech(x,signal);            % �������������������
    N=length(x);                            % �źų���
    N_l=N;
    time=(0:N-1)/fs;                      % ����ʱ��̶�
    IS=.15;                                   % ����IS

    output=SSBoll79m(signal,fs,IS,Cfactor5,Cfactor4,Cfactor1,Cfactor2,c);          
    % ����SSBoll79�������׼�
    ol=length(output);                      % ��output������x�ȳ�
    if ol<N
        output=[output; zeros(N-ol,1)];
    end
    snr2=SNR_singlech(x,output);            % �����׼���������
    snr=snr2-snr1;
    string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt'};
    set(handles.edit6,'string',num2str(snr1));
    set(handles.edit8,'string',num2str(snr2));
    set(handles.edit7,'string',num2str(snr));

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
    set(handles.edit10,'string',num2str(RunTime));
    Long2=length(x);
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%���ż�
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
wav_KBoardsave();


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
function popupmenu4_CreateFcn(hObject, eventdata, handles)
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
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
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
%%%  ����ͼ
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Cfactor3=str2num(get(handles.edit1,'string'));       %  ֡�Ʊ�
% Cfactor5=str2num(get(handles.edit9,'string'));       %  ֡��
Cfactor4=str2num(get(handles.edit4,'string'));       %  ֡�Ʊ�
Cfactor5=str2num(get(handles.edit5,'string'));       %  ֡��
Cfactor4=Cfactor5*Cfactor4;
Power_calculate(Cfactor5,Cfactor4)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Clear_File;
