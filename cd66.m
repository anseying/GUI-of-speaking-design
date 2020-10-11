function varargout = cd66(varargin)
% CD66 MATLAB code for cd66.fig
%      CD66, by itself, creates a new CD66 or raises the existing
%      singleton*.
%
%      H = CD66 returns the handle to a new CD66 or the handle to
%      the existing singleton*.
%
%      CD66('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CD66.M with the given input arguments.
%
%      CD66('Property','Value',...) creates a new CD66 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cd66_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cd66_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cd66

% Last Modified by GUIDE v2.5 06-May-2017 20:01:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cd66_OpeningFcn, ...
                   'gui_OutputFcn',  @cd66_OutputFcn, ...
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


% --- Executes just before cd66 is made visible.
function cd66_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cd66 (see VARARGIN)

% Choose default command line output for cd66
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cd66 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cd66_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('确定退出','退出','YES','NO','YES');
if strcmp(button,'YES')
    close('cd66');
elseif strcmp(button,'NO')
    return;
end
