function varargout = HeatSimulationGui(varargin)
% HEATSIMULATIONGUI MATLAB code for HeatSimulationGui.fig
%      HEATSIMULATIONGUI, by itself, creates a new HEATSIMULATIONGUI or raises the existing
%      singleton*.
%
%      H = HEATSIMULATIONGUI returns the handle to a new HEATSIMULATIONGUI or the handle to
%      the existing singleton*.
%
%      HEATSIMULATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEATSIMULATIONGUI.M with the given input arguments.
%
%      HEATSIMULATIONGUI('Property','Value',...) creates a new HEATSIMULATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HeatSimulationGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HeatSimulationGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HeatSimulationGui

% Last Modified by GUIDE v2.5 30-Sep-2018 14:58:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HeatSimulationGui_OpeningFcn, ...
                   'gui_OutputFcn',  @HeatSimulationGui_OutputFcn, ...
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


% --- Executes just before HeatSimulationGui is made visible.
function HeatSimulationGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HeatSimulationGui (see VARARGIN)

% Choose default command line output for HeatSimulationGui
handles.output = hObject;
axes(handles.axes2);
imshow('picitsx.png');
axes(handles.axes3);
imshow('picmathx.png');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HeatSimulationGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HeatSimulationGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
L = str2num(get(handles.edit2,'String'));
T0 = str2num(get(handles.edit3,'String'));
K = str2num(get(handles.edit4,'String'));
rho = str2num(get(handles.edit5,'String'));
sig = str2num(get(handles.edit8,'String'));

alp = sqrt(K/(sig*rho));

cla(handles.axes1);
axes(handles.axes1);
grid on;

% n = 1:1:1;
% t = 100;
% x = 0:.1:10;
% u = zeros([1 length(x)]);
% for i = 1:1:length(x)
%     temp = 0;
%     for j = 1:1:length(n)
%         temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
%     end
%     u(i) = temp;
% end
% plot(x,u,'linewidth',1.25); hold on;
% 
% n = 1:1:5;
% t = 100;
% x = 0:.1:10;
% u = zeros([1 length(x)]);
% for i = 1:1:length(x)
%     temp = 0;
%     for j = 1:1:length(n)
%         temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
%     end
%     u(i) = temp;
% end
% plot(x,u,'linewidth',1.25); hold on;
% 
% n = 1:1:10;
% t = 100;
% x = 0:.1:10;
% u = zeros([1 length(x)]);
% for i = 1:1:length(x)
%     temp = 0;
%     for j = 1:1:length(n)
%         temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
%     end
%     u(i) = temp;
% end
% plot(x,u,'linewidth',1.25); hold on;
% 
% n = 1:1:15;
% t = 100;
% x = 0:.1:10;
% u = zeros([1 length(x)]);
% for i = 1:1:length(x)
%     temp = 0;
%     for j = 1:1:length(n)
%         temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
%     end
%     u(i) = temp;
% end
% plot(x,u,'linewidth',1.25); hold on;
% 
% n = 1:1:30;
% t = 100;
% x = 0:.1:10;
% u = zeros([1 length(x)]);
% for i = 1:1:length(x)
%     temp = 0;
%     for j = 1:1:length(n)
%         temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
%     end
%     u(i) = temp;
% end
% plot(x,u,'linewidth',1.25); hold on;

term = [1 5 10 15 30 50];
t = 1;
x = 0:.1:10;
u = zeros([1 length(x)]);

for count = 1:1:6
    n = 1:1:term(count);
    for i = 1:1:length(x)
        temp = 0;
        for j = 1:1:length(n)
            temp = temp + (2*T0/(j*pi))*(1-cos(j*pi))*exp(-(j*pi/L)^2*alp^2*t)*sin(j*pi*x(i)/L);
        end
        u(i) = temp;
    end
    plot(x,u,'linewidth',1.25); hold on;
end

legend('n = 1','n = 5','n = 10','n = 15','n = 30','n = 50')
set(handles.edit7,'String',toc);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit4,'String','');
set(handles.edit5,'String','');
set(handles.edit7,'String','');
set(handles.edit8,'String','');

title('');
axes(handles.axes1);
legend('hide');
cla(handles.axes1);

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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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
