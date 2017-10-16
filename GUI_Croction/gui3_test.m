function varargout = gui3_test(varargin)
% GUI3_TEST MATLAB code for gui3_test.fig
%      GUI3_TEST, by itself, creates a new GUI3_TEST or raises the existing
%      singleton*.
%
%      H = GUI3_TEST returns the handle to a new GUI3_TEST or the handle to
%      the existing singleton*.
%
%      GUI3_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI3_TEST.M with the given input arguments.
%
%      GUI3_TEST('Property','Value',...) creates a new GUI3_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui3_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui3_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui3_test

% Last Modified by GUIDE v2.5 23-Sep-2017 10:23:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui3_test_OpeningFcn, ...
                   'gui_OutputFcn',  @gui3_test_OutputFcn, ...
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


% --- Executes just before gui3_test is made visible.
function gui3_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui3_test (see VARARGIN)

% Choose default command line output for gui3_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
value=1;
handles.value=value;
% UIWAIT makes gui3_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% model=load('QuadraticSVM.mat');
% model=model.QuadraticSVMSim;
% handles.model=model;


% --- Outputs from this function are returned to the command line.
function varargout = gui3_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global draw_enable;  %定义一个标志，1表示绘图，0表示停止绘图
global x;
global y;
draw_enable=1;
if draw_enable
    position=get(gca,'currentpoint');  %gca（获取当前坐标轴的句柄）
    x(1)=position(1);
    y(1)=position(3);
end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global draw_enable;
global x;
global y;
global h1;
if draw_enable==1
    position=get(gca,'currentpoint');
    x(2)=position(1);
    y(2)=position(3);
    h1=line(x,y,'LineWidth',5,'color','g');
    x(1)=x(2);
    y(1)=y(2);   %鼠标移动，随时更新数据
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global draw_enable  
draw_enable=0;


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=getframe(handles.axes1);
% imwrite(h.cdata,'aftersave.bmp','bmp');
% im=imread('aftersave.bmp');
im=rgb2gray(h.cdata);
im=imresize(im,[28,28]);
im=im2bw(im,0.9);
im=~im;
im=uint8(im*255);
assignin('base','im',im)  
imwrite(im,'input.bmp','bmp');
cla(handles.axes1);

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
set(handles.edit1,'string','');
% cla(handles.axes3);
cla;   %cla清空坐标轴



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% M=evalin('base','QuadraticSVMSim');
% model=load('QuadraticSVM.mat');
% model=model.QuadraticSVMSim;
value=1;
str=[num2str(value),'.bmp'];
model=load('QuadraticSVM');
model=model.d;
% model=evalin('base','d');
h=getframe(handles.axes1);
img=rgb2gray(h.cdata);
img=imresize(img,[28,28]);
img=im2bw(img,0.95);
img=~img;
img=uint8(img*255);
% h=getframe(handles.axes3);
% imshow(img);
% feature1=TurncationTime(img);
feature2=FeatureBlock(img);
% feature3=COG(img);
 feature4=Quadruple(img);
feature=[feature2];
output=predict(model,feature);
set(handles.edit1,'string',output);
imwrite(img',str);
% assignin('base','out2',feature);   



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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
