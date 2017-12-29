function varargout = guiV2(varargin)
% GUIV2 MATLAB code for guiV2.fig
%      GUIV2, by itself, creates a new GUIV2 or raises the existing
%      singleton*.
%
%      H = GUIV2 returns the handle to a new GUIV2 or the handle to
%      the existing singleton*.
%
%      GUIV2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIV2.M with the given input arguments.
%
%      GUIV2('Property','Value',...) creates a new GUIV2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiV2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiV2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiV2

% Last Modified by GUIDE v2.5 21-Dec-2017 23:29:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiV2_OpeningFcn, ...
                   'gui_OutputFcn',  @guiV2_OutputFcn, ...
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


% --- Executes just before guiV2 is made visible.
function guiV2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiV2 (see VARARGIN)

% Choose default command line output for guiV2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiV2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
imshow('Drumhead.jpg', 'parent',handles.axes1)

set(handles.valAmp,'String',get(handles.sliderAmp,'Value'))
set(handles.valDim,'String',get(handles.sliderDim,'Value'))
set(handles.valRho,'String',get(handles.sliderRho,'Value'))
set(handles.valEta,'String',get(handles.sliderEta,'Value'))
set(handles.valGanho,'String',get(handles.sliderGanho,'Value'))

set(handles.valA1,'String',get(handles.sliderA1,'Value'))
set(handles.valA2,'String',get(handles.sliderA2,'Value'))
set(handles.valA3,'String',get(handles.sliderA3,'Value'))
set(handles.valT1,'String',get(handles.sliderT1,'Value'))
set(handles.valT2,'String',get(handles.sliderT2,'Value'))
set(handles.valT3,'String',get(handles.sliderT3,'Value'))
set(handles.checkboxRev,'Value',1)
set(handles.valDim,'String',get(handles.sliderDim,'Value'))

% --- Outputs from this function are returned to the command line.
function varargout = guiV2_OutputFcn(hObject, eventdata, handles) 
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
coordinates = get(hObject,'CurrentPoint'); 
coordinates = coordinates(1,1:2);
message     = sprintf('x: %f , y: %f',coordinates (1)/601 ,coordinates (2)/601);
display(message);
if(coordinates (1) <= 601)
    PO_finDiff_Basico(coordinates(1)/601,coordinates(2)/601, get(handles.sliderAmp,'Value'), ...
        get(handles.sliderDim,'Value'), get(handles.sliderRho,'Value'), ...
        get(handles.sliderEta,'Value'), get(handles.sliderGanho,'Value'), ...
        get(handles.sliderA1,'Value'), get(handles.sliderT1,'Value'), ...
        get(handles.sliderA2,'Value'), get(handles.sliderT2,'Value'), ...
        get(handles.sliderA3,'Value'), get(handles.sliderT3,'Value'), ...
        get(handles.checkboxRev,'Value'), get(handles.checkboxInitCond,'Value'));
end


% --- Executes on slider movement.
function sliderAmp_Callback(hObject, eventdata, handles)
% hObject    handle to sliderAmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valAmp,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderAmp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderAmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderRho_Callback(hObject, eventdata, handles)
% hObject    handle to sliderRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valRho,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderRho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderDim_Callback(hObject, eventdata, handles)
% hObject    handle to sliderDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valDim,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderDim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderEta_Callback(hObject, eventdata, handles)
% hObject    handle to sliderEta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valEta,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderEta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderEta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderGanho_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGanho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valGanho,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderGanho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGanho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderA1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderA1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valA1,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderA1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderA1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderA2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderA2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valA2,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderA2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderA2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderA3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderA3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valA3,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderA3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderA3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderT1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valT1,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderT1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderT2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valT2,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderT3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderT3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.valT3,'String',get(hObject,'Value'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderT3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderT3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkboxRev.
function checkboxRev_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxRev


% --- Executes on button press in checkboxInitCond.
function checkboxInitCond_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxInitCond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxInitCond
