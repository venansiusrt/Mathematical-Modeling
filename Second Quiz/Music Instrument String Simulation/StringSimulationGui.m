function varargout = StringSimulationGui(varargin)
% STRINGSIMULATIONGUI MATLAB code for StringSimulationGui.fig
%      STRINGSIMULATIONGUI, by itself, creates a new STRINGSIMULATIONGUI or raises the existing
%      singleton*.
%
%      H = STRINGSIMULATIONGUI returns the handle to a new STRINGSIMULATIONGUI or the handle to
%      the existing singleton*.
%
%      STRINGSIMULATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STRINGSIMULATIONGUI.M with the given input arguments.
%
%      STRINGSIMULATIONGUI('Property','Value',...) creates a new STRINGSIMULATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StringSimulationGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StringSimulationGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StringSimulationGui

% Last Modified by GUIDE v2.5 28-Nov-2018 20:19:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StringSimulationGui_OpeningFcn, ...
                   'gui_OutputFcn',  @StringSimulationGui_OutputFcn, ...
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


% --- Executes just before StringSimulationGui is made visible.
function StringSimulationGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StringSimulationGui (see VARARGIN)

% Choose default command line output for StringSimulationGui
handles.output = hObject;
axes(handles.axes2);
imshow('picits1.png');
axes(handles.axes3);
imshow('picmath1.png');

axes(handles.axes4);
xlabel('TIME','FontSize',10,'FontWeight','bold','Color','k');
ylabel('DEFLECTION','FontSize',10,'FontWeight','bold','Color','k');

axes(handles.axes1);
xlabel('TIME','FontSize',10,'FontWeight','bold','Color','k');
ylabel('DEFLECTION','FontSize',10,'FontWeight','bold','Color','k');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StringSimulationGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StringSimulationGui_OutputFcn(hObject, eventdata, handles) 
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
cla(handles.axes1); cla(handles.axes4); axes(handles.axes1); 
tic;
L = str2num(get(handles.edit2,'String'));
u0 = str2num(get(handles.edit3,'String'));
ut0 = str2num(get(handles.edit4,'String'));
T = str2num(get(handles.edit5,'String'));
miu = str2num(get(handles.edit6,'String'));

n = [1 2 3 4 5];
omega = zeros([1 5]);

%% PRINT FIGURE 1%%
for i = 1:1:5
    omega(i) = n(i)*pi*sqrt(T/miu)/L;
end

t = 0:0.01:3;
x = 1;
u = zeros([5 301]);
a = zeros([1 5]);
b = zeros([1 5]);

for i = 1:1:5
    b(i) = u0/sin(n(i)*pi*x/L);
end

for i = 1:1:5
    a(i) = ut0/(omega(i)*sin(n(i)*pi*x/L));
end

for j = 1:1:5
    for i = 1:1:301
        u(j,i) = sin(n(j)*pi*x/L)*(a(j)*sin(omega(j)*t(i))+b(j)*cos(omega(j)*t(i)));
    end
end

for i = 1:1:5
    plot(t,u(i,:), 'linewidth', 1.15); hold on;
end

grid on;
legend('n = 1','n = 2','n = 3','n = 4','n = 5');
xlabel('TIME','FontSize',10,'FontWeight','bold','Color','k');
ylabel('DEFLECTION','FontSize',10,'FontWeight','bold','Color','k');
handles.axes1.GridColor = 'k';

%%PRINT FIGURE 2%%
axes(handles.axes4);
for i = 1:1:5
    b(i) = ((4*L)/(n(i)*pi)^2)*(sin(n(i)*pi/2));
end

for j = 1:1:5
    for ix = 1:3
        U(j,ix) = b(j)*sin(n(j)*pi*x/L)*cos(n(j)*pi*sqrt(T/miu)*ix/L);
    end
end

for count = 1:1:5 
    plot(1:3,U(count,:), 'linewidth', 1.5); hold on;
end

legend('n = 1','n = 2','n = 3','n = 4','n = 5');
xlabel('TIME','FontSize',10,'FontWeight','bold','Color','k');
ylabel('DEFLECTION','FontSize',10,'FontWeight','bold','Color','k');
handles.axes4.GridColor = 'k';
grid on;

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
set(handles.edit6,'String','');
set(handles.edit7,'String','');

axes(handles.axes1);
title('');
legend('hide');
cla(handles.axes1);
grid off

axes(handles.axes4);
title('');
legend('hide');
cla(handles.axes4);
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
