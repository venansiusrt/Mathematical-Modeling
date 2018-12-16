function varargout = TidalSimulationGui(varargin)
% TIDALSIMULATIONGUI MATLAB code for TidalSimulationGui.fig
%      TIDALSIMULATIONGUI, by itself, creates a new TIDALSIMULATIONGUI or raises the existing
%      singleton*.
%
%      H = TIDALSIMULATIONGUI returns the handle to a new TIDALSIMULATIONGUI or the handle to
%      the existing singleton*.
%
%      TIDALSIMULATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIDALSIMULATIONGUI.M with the given input arguments.
%
%      TIDALSIMULATIONGUI('Property','Value',...) creates a new TIDALSIMULATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TidalSimulationGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TidalSimulationGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TidalSimulationGui

% Last Modified by GUIDE v2.5 28-Sep-2018 10:57:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TidalSimulationGui_OpeningFcn, ...
                   'gui_OutputFcn',  @TidalSimulationGui_OutputFcn, ...
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


% --- Executes just before TidalSimulationGui is made visible.
function TidalSimulationGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TidalSimulationGui (see VARARGIN)

% Choose default command line output for TidalSimulationGui
handles.output = hObject;
axes(handles.axes2);
imshow('picits.png');
axes(handles.axes3);
imshow('picmath.png');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TidalSimulationGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TidalSimulationGui_OutputFcn(hObject, eventdata, handles) 
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
u0 = str2num(get(handles.edit3,'String'));
ut0 = str2num(get(handles.edit4,'String'));
h = str2num(get(handles.edit5,'String'));

x=1;
t = 0:0.01:1;
g = 9.8;
n = [1 2 3];

an = zeros([1 3]);
bn = zeros([1 3]);
omega = zeros([1 3]);
u = zeros([3 length(t)]);

for i = 1:1:3
    omega(i) = n(i)*pi*sqrt(g*h)/L;
    bn(i) = u0/sin(n(i)*pi*x/L);
    an(i) = ut0/(omega(i)*sin(n(i)*pi*x/L));
    for j = 1:1:length(t)
        u(i,j) = sin(n(i).*pi*x/L).*(an(i).*sin(omega(i).*t(j))+bn(i).*cos(omega(i).*t(j)));
    end
end

axes(handles.axes1);

for i = 1:1:3
    plot(t,u(i,:)); hold on;
end

cla(handles.axes1);
for i = 1:1:3
    plot(t,u(i,:), 'linewidth', 1.15); hold on;
end

cla(handles.axes1);
for i = 1:1:3
    plot(t,u(i,:), 'linewidth', 1.15); hold on;
end

% cla(handles.axes1);
% curve1 = animatedline('Color','r','linewidth',1.15);
% for j = 1:1:length(t)
%         addpoints(curve1,t(j),u(1,j));
%         drawnow; pause(0.01);
% end
% 
% curve2 = animatedline('Color','b','linewidth',1.15);
% for j = 1:1:length(t)
%         addpoints(curve2,t(j),u(2,j));
%         drawnow; pause(0.01);
% end
% 
% curve3 = animatedline('Color','g','linewidth',1.15);
% for j = 1:1:length(t)
%         addpoints(curve3,t(j),u(3,j));
%         drawnow; pause(0.01);
% end

legend('n = 1','n = 2','n = 3');
xlabel('TIME','FontSize',10,'FontWeight','bold','Color','k');
ylabel('DEFLECTION','FontSize',10,'FontWeight','bold','Color','k');
handles.axes1.GridColor = 'k';

[x,t] = meshgrid(0:0.01:1);

k=1;
axes(handles.axes4);
title('n=1');
z =sin(k*pi.*x/L).*(an(k).*sin(omega(k).*t)+bn(k).*cos(omega(k)*t));
mesh(x,t,z);

k=2;
axes(handles.axes5);
legend('n=2');
z =sin(k*pi.*x/L).*(an(k).*sin(omega(k).*t)+bn(k).*cos(omega(k)*t));
mesh(x,t,z);

k=3;
axes(handles.axes6);
title('n=3');
z =sin(k*pi.*x/L).*(an(k).*sin(omega(k).*t)+bn(k).*cos(omega(k)*t));
mesh(x,t,z);

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

title('');
axes(handles.axes1);
legend('hide');
cla(handles.axes1);
cla(handles.axes4);
cla(handles.axes5);
cla(handles.axes6);
grid off

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
