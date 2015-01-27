function varargout = LicensePlateExtractor(varargin)
% LICENSEPLATEEXTRACTOR MATLAB code for LicensePlateExtractor.fig
%      LICENSEPLATEEXTRACTOR, by itself, creates a new LICENSEPLATEEXTRACTOR or raises the existing
%      singleton*.
%
%      H = LICENSEPLATEEXTRACTOR returns the handle to a new LICENSEPLATEEXTRACTOR or the handle to
%      the existing singleton*.
%
%      LICENSEPLATEEXTRACTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENSEPLATEEXTRACTOR.M with the given input arguments.
%
%      LICENSEPLATEEXTRACTOR('Property','Value',...) creates a new LICENSEPLATEEXTRACTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LicensePlateExtractor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LicensePlateExtractor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LicensePlateExtractor

% Last Modified by GUIDE v2.5 21-Jan-2015 12:25:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LicensePlateExtractor_OpeningFcn, ...
                   'gui_OutputFcn',  @LicensePlateExtractor_OutputFcn, ...
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


% --- Executes just before LicensePlateExtractor is made visible.
function LicensePlateExtractor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LicensePlateExtractor (see VARARGIN)

% Remove axis and ticks from all axes
set(gca,'xtick',[],'ytick',[])

% Choose default command line output for LicensePlateExtractor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LicensePlateExtractor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LicensePlateExtractor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in importButton.
function importButton_Callback(hObject, eventdata, handles)
% hObject    handle to importButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FILENAME, PATHNAME] = uigetfile(sprintf('%s/*.avi',strrep(mfilename('fullpath'),mfilename(),'')));
% Load the video object.
handles.video = VideoReader(sprintf('%s%s',PATHNAME,FILENAME));
handles.currentFrame = 1;
% Update GUI
set(handles.fileLabel,'String',FILENAME);
image(read(handles.video,1));
% Remove axis and ticks from all axes
set(gca,'xtick',[],'ytick',[]);
set(handles.uitable1,'Data',{});
updateCurrentFrame(hObject, handles,1);
% Update handles structure
guidata(hObject, handles);


function updateCurrentFrame(hObject, handles, frame_number)
% Update the label which displays the current frame and the total amount of
% frames
frames = sprintf('%d / %d',frame_number,handles.video.NumberOfFrames);
set(handles.frameLabel,'String',frames);
handles.currentFrame = frame_number;
% Update handles structure
guidata(hObject, handles);


function updateToggleButton(hObject, handles, value)
set(handles.processToggle, 'Value', value);
if value
    set(handles.processToggle, 'String', 'Stop processing');
else
    set(handles.processToggle, 'String', 'Start processing');
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in processToggle.
function processToggle_Callback(hObject, eventdata, handles)
% hObject    handle to processToggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Update toggle button text
updateToggleButton(hObject, handles, get(handles.processToggle, 'Value'));
tic;
results = get(handles.uitable1,'Data');
h = get(handles.previewWindow,'Children');
i = handles.currentFrame;
while get(handles.processToggle, 'Value') && i <= handles.video.NumberOfFrames
    frame = read(handles.video, i);
    set(h,'CData', frame);
    updateCurrentFrame(hObject, handles,i);
    kenteken = run(frame);
    if length(kenteken)>1
        index = size(results,1)+1;
        results{index,1} = kenteken;
        results{index,2} = i;
        time = toc;
        results{index,3} = time; 
        set(handles.uitable1,'Data',results);
        updateProcessingTime(hObject, handles);
    end
    i = i + 4;
end
solutionFile = 'beoordelingSolutions.mat';
checkSolution(results, solutionFile);
% Hint: get(hObject,'Value') returns toggle state of processToggle

function updateProcessingTime(hObject, handles)
time = sprintf('%0.2f%s',toc,'s');
set(handles.timeLabel,'String',time);
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateToggleButton(hObject, handles, 0);
updateCurrentFrame(hObject, handles, 1);
image(read(handles.video,1));
set(handles.uitable1,'Data',[]);
% Update handles structure
guidata(hObject, handles);
% NOTE: DO NOT FORGET TO CLEAR THE TABLE WHEN FILLED!!!!
