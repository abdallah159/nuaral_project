function varargout = ftmtm(varargin)
% FTMTM MATLAB code for ftmtm.fig
%      FTMTM, by itself, creates a new FTMTM or raises the existing
%      singleton*.
%
%      H = FTMTM returns the handle to a new FTMTM or the handle to
%      the existing singleton*.
%
%      FTMTM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTMTM.M with the given input arguments.
%
%      FTMTM('Property','Value',...) creates a new FTMTM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ftmtm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ftmtm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ftmtm

% Last Modified by GUIDE v2.5 07-May-2017 15:57:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ftmtm_OpeningFcn, ...
                   'gui_OutputFcn',  @ftmtm_OutputFcn, ...
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


% --- Executes just before ftmtm is made visible.
function ftmtm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ftmtm (see VARARGIN)

% Choose default command line output for ftmtm
handles.output = hObject;
axes(handles.axes1)
imshow('53.JPG')
axes(handles.axes2)
imshow('logo.PNG')



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ftmtm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ftmtm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

%another way
global  filename
[filename pathname] = uigetfile({'*.jpg';'*.png'},'File Selector');
image = strcat(pathname, filename);
axes(handles.axes3);
imshow(image)
handles.img =filename;
%set(handles.edit7,'string',handles.img);
%check_callback(hobject,eventdata,handles,m);
guidata(hObject,handles);







% --- Executes on button press in classifiy.
function classifiy_Callback(hObject, ~, handles)
% hObject    handle to classifiy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles = guidata(hObject);

%connection to database

image_folder='D:\3th\2nd semester\Neural Network\NP\DB\';
filename=dir(fullfile(image_folder,'*.jpg')); 


if (isequal(filename,image_folder))
conn=database('fruits','','');
cursn = exec(conn,'SELECT fruitname FROM fruits WHERE ID = 1 ');
dn = fetch(cursn);
cursnn= dn.DATA;
set(handles.edit7,'string',cursnn);
cursc = exec(conn,'SELECT color FROM fruits WHERE ID = 1 ');
dc = fetch(cursc);
curscc= dc.DATA;
set(handles.edit8,'string',curscc);
curst = exec(conn,'SELECT fruit_texture FROM fruits WHERE ID = 1 ');
dt = fetch(curst);
curstt= dt.DATA;
set(handles.edit6,'string',curstt);

%elseif (isequal(path,image_folder))
%conn=database('fruits','','');
%cursn = exec(conn,'SELECT fruitname FROM fruits WHERE ID = 4 ');
%dn = fetch(cursn);
%cursnn= dn.DATA;
%set(handles.edit7,'string',cursnn);
%cursc = exec(conn,'SELECT color FROM fruits WHERE ID = 4 ');
%dc = fetch(cursc);
%curscc= dc.DATA;
%set(handles.edit8,'string',curscc);
%curst = exec(conn,'SELECT fruit_texture FROM fruits WHERE ID = 4 ');
%dt = fetch(curst);
%curstt= dt.DATA;
%set(handles.edit6,'string',curstt);



%end
%sqlquerypixel=['SELECT pixel FROM fruits' ...
    %'WHERE fruitname = ' '''' handles.img '''']; 
%sqlqueryinput=['SELECT input FROM fruits' ...
    %'WHERE fruitname = ' '''' handles.img '''']; 

%fetch image pixel from database
%curspixel=exec(conn,sqlquerypixel);
%cp=fetch(curspixel);
%datapixel=get(cp,'DATE');
%set(handles.edit8,'string',datapixel);
%fetch image fruit_texture from database
%cursinput=exec(conn,sqlqueryinput);
%ci=fetch(cursinput);
%datainput=get(ci,'DATE');





%image_folder='D:\3th\2nd semester\Neural Network\NP\DB';
%filename=dir(fullfile(image_folder,'*.jpg'));
%c=[1  12  146];
%r=[1  104  156];
%pixels = impixel(handles.img,c,r);
%z=[10  100  200];
%p1 = [sum(pixels)];
%p2 = [p1-z];
%p=[p1 ; p2];
%%plot(p1,p2);
%t1 =datapixel;
%t2 = datainput;
%t=[t1  t2];
%w=t * p;
%if(p1 == t1) 
    %msgbox('image exist');
    %return

%else
    %msgbox('not exist');
end
    


 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)








function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox('the fruit is add to database');

