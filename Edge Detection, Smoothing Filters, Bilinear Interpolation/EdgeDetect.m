function varargout = EdgeDetect(varargin)
% EDGEDETECT MATLAB code for EdgeDetect.fig
%      EDGEDETECT, by itself, creates a new EDGEDETECT or raises the existing
%      singleton*.
%
%      H = EDGEDETECT returns the handle to a new EDGEDETECT or the handle to
%      the existing singleton*.
%
%      EDGEDETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGEDETECT.M with the given input arguments.
%
%      EDGEDETECT('Property','Value',...) creates a new EDGEDETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EdgeDetect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EdgeDetect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EdgeDetect_OpeningFcn, ...
                   'gui_OutputFcn',  @EdgeDetect_OutputFcn, ...
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


% --- Executes just before EdgeDetect is made visible.
function EdgeDetect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EdgeDetect (see VARARGIN)

% Choose default command line output for EdgeDetect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EdgeDetect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.

    %Read Image
    im = imread('a1.jpg');
    im = rgb2gray(im);


function varargout = EdgeDetect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sThres_Callback(hObject, eventdata, handles)
% hObject    handle to sThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sThres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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


% --- Executes on slider movement.
function sSigma_Callback(hObject, eventdata, handles)
% hObject    handle to sSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function tThres_Callback(hObject, eventdata, handles)
% hObject    handle to tThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tThres as text
%        str2double(get(hObject,'String')) returns contents of tThres as a double




% --- Executes during object creation, after setting all properties.
function tThres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function tSigma_Callback(hObject, eventdata, handles)
% hObject    handle to tSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSigma as text
%        str2double(get(hObject,'String')) returns contents of tSigma as a double


% --- Executes during object creation, after setting all properties.
function tSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function imOut = cannyEdge(thres,sigma)



    imOut = edge(im,'canny', 0.3, 1.5);

    % edge(im,'canny', thresh, sigma);
    % Increase Threshold  ->  Less edges
    % Increase Sigma  -> Less edges
    





%     figure
%     subplot(1,2,1);
%     imshow(im);
%     title 'Input';
% 
%     subplot(1,2,2);
%     imshow(imEdge);
%     title 'Output';
    
