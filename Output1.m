function varargout = Output1(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Output1_OpeningFcn, ...
                   'gui_OutputFcn',  @Output1_OutputFcn, ...
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


% --- Executes just before Output1 is made visible.
function Output1_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Output1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = Output1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
a=evalin('base','a');
b=evalin('base','b');
n=evalin('base','n');
m=evalin('base','m');
type=evalin('base','type');
input=evalin('base','input');
% We use Controllable Canonical Form (CCF)
Atmp = a/ -a(end)
Btmp = b/ a(end)


%A Matrix :
    tmp1 = Atmp(2:end-1);
    tmp2 = eye(n-1);
    tmp3 = [tmp2;tmp1];
    tmp4 = zeros(n,1);
    tmp4(n,1)= Atmp(1);
    A = [tmp4,tmp3]
    
%B Matrix :
    B = zeros(n,1);
    B(n,1) = 1 

    
%C & D Matrix :
    if(n==m)
        C = zeros(1,n);
        Atmp = Atmp * -1;
        for i= 1 : n
            C(i) = Btmp(i)-(Atmp(i)*Btmp(end));
        end
        C
        D = Btmp(end)   
    end
    
    if(n>m)
       C = zeros(1,n);
      for i = 1 : length(Btmp) 
          C(i) = Btmp(i);
      end
      C
      D = 0
    end
    
h = 0.001 ; %time step
t =  0-h : h : 10;
    q = zeros(1,n);
    y_values = zeros(n,length(t));
    y_values(:,1) = q; 
    for i = 1 : (length(t)-1) 
              k = A*y_values(:,i) + B*input(i);
              y_values(:,i+1) = y_values(:,i) + k*h;
    end
    assignin('base','y_values',y_values);
    plot(t,y_values(1,:));
    if(type==1)
        title('Step response');
    else
        title('Impluse response');
    end    
    xlabel('time');
    ylabel('Amplitude');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

Output2
