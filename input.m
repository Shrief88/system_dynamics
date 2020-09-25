function varargout = input(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @input_OpeningFcn, ...
                   'gui_OutputFcn',  @input_OutputFcn, ...
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


% --- Executes just before input is made visible.
function input_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for input
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = input_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
type=evalin('base','type');
a=evalin('base','a');
b=evalin('base','b');
m=evalin('base','m');
h = 0.001 ; %time step
t = 0-h : h : 10;
diff1 = zeros(size(t));
diff2 = zeros(size(t));
diff3 = zeros(size(t));
diff4 = zeros(size(t));

if(type == 1) %Step
   % code to generate the step function 
   step = ones(size(t));
   step(1:1000) = 0;
   
   if(m>=1)
     for i = 1 : length(t)-1
       diff1(i) = (step(i+1) - step(i))/h;
     end
   end  
else
    %code to generate the unit impluse
    impluse = zeros(size(t));
    impluse(1001) = 1/h;
    if(m>=1)
     for i = 1 : length(t)-1
       diff1(i) = (impluse(i+1) - impluse(i))/h;
     end
    end  
end   
   if(m>=2)
       for i = 1 : length(t)-1
           diff2(i) = (diff1(i+1) - diff1(i))/h;
       end
   end
   
   if(m>=3)
       for i = 1 : length(t)-1
         diff3(i) = (diff2(i+1) - diff2(i))/h;
       end
   end
   
   if(m>=4)
       for i = 1 : length(t)-1
         diff4(i) = (diff3(i+1) - diff3(i))/h;
       end
   end

   
   
    
Btmp = b/ a(end); %coefficients of the input
if (length(Btmp) ~= 5)
   for i = (length(Btmp)+1) : 5
        Btmp = [Btmp, 0];
    end
end

if(type == 1)
    input = Btmp(1)*step + Btmp(2)*diff1 + Btmp(3)*diff2 + Btmp(4)*diff3 + Btmp(5)*diff4; 
    plot(t,step);
else
    input = Btmp(1)*impluse + Btmp(2)*diff1 + Btmp(3)*diff2 + Btmp(4)*diff3 + Btmp(5)*diff4; 
    plot(t,impluse);
end


assignin('base','input',input);
xlabel('time');
ylabel('input');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

Output1;
