function varargout = Output2(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Output2_OpeningFcn, ...
                   'gui_OutputFcn',  @Output2_OutputFcn, ...
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


% --- Executes just before Output2 is made visible.
function Output2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Output2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

y_values=evalin('base','y_values');
n = evalin('base','n');
h = 0.001 ; %time step
t = 0-h : h : 10;

if(n==1)
    axes(handles.axes1);
    plot(t,y_values(1,:));
    legend('x1(t)');
elseif(n==2)
  axes(handles.axes1);
  plot(t,y_values(1,:));
  legend('x1(t)');
  axes(handles.axes2);
  plot(t,y_values(2,:));
  legend('x2(t)');
elseif(n==3)
   axes(handles.axes1);
  plot(t,y_values(1,:));
  legend('x1(t)');
  axes(handles.axes2);
  plot(t,y_values(2,:));
  legend('x2(t)');
  axes(handles.axes3);
  plot(t,y_values(3,:));
  legend('x3(t)');
elseif(n==4)
  axes(handles.axes1);
  plot(t,y_values(1,:));
  legend('x1(t)');
  axes(handles.axes2);
  plot(t,y_values(2,:));
  legend('x2(t)');
  axes(handles.axes3);
  plot(t,y_values(3,:));
  legend('x3(t)');
  axes(handles.axes4);
  plot(t,y_values(4,:));
  legend('x4(t)');
end
