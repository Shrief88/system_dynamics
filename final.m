function varargout = final(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;



function title_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function title_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
b=getappdata(0,'b');
n=getappdata(0,'n');
m=getappdata(0,'m');
unit = get(handles.unit,'Value');
impluse = get(handles.impluse,'Value');
% we will set 1 to refer to unit step and 0 to refer to unit impluse
if (unit ==1)
    type =1;
    assignin('base','type',type);
end
if(impluse == 1)
     type =0;
    assignin('base','type',type);
end    
if(n<m)
    msgbox('m must be less or equal to n');
elseif((n+1)~=length(a))
    msgbox('a values is not equal to n');
elseif((m+1)~=length(b))
    msgbox('b values is not equal to m');
else
   assignin('base','a',a);
   assignin('base','b',b);
   assignin('base','n',n);
   assignin('base','m',m);
   input;
end

    


function a_values_Callback(hObject, eventdata, handles)

A_values = get(handles.a_values, 'String');
flag = 0;
a = double.empty;
for i = 1 : length(A_values)
    
    if (A_values(i)<0 & A_values(i)>9 & A_values(i) ~= ',' &  A_values(i) ~= '.') 
        flag = flag +1;
    end   
    if (i == length(A_values))
        continue;
    end    
    if(A_values(i) == ',' & A_values(i+1) == ',')
       flag = flag +1;
    end  
    if(A_values(i) == '.' & A_values(i+1) == '.')
       flag = flag +1;
    end  
end  
if (flag ~= 0)
    msgbox('Invalid syntax');  
else
    i =1;
    while ( i < length(A_values))
        
        s = A_values(i);
        if(i ~= length(A_values))
           i = i+1;
        else
            break; 
        end 
        while(A_values(i)~= ',')
             s = strcat(s,A_values(i));
             if(i ~= length(A_values))
                 i = i+1;
             else
                break;  
             end  
        end
        s = str2double(s);
        a = [a, s];
    end
end
setappdata(0,'a',a);
        
% --- Executes during object creation, after setting all properties.
function a_values_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_values_Callback(hObject, eventdata, handles)
m=getappdata(0,'m');
B_values = get(handles.b_values, 'String');
flag = 0;
b = double.empty;
for i = 1 : length(B_values)
    if(B_values(i) == ',')
            continue;
    end 
    if (B_values(i)<0 & B_values(i)>9 & B_values(i) ~= ',') 
        flag = flag +1;
    end   
    if (i == length(B_values))
        continue;
    end    
    if(B_values(i) == ',' & B_values(i+1) == ',')
       flag = flag +1;
    end   
end  
if (flag ~= 0)
    msgbox('Invalid syntax');  
else
    i =1;
    if(length(B_values)==1)
       s = B_values(i); 
       s = str2double(s);
       b = [b, s];
    else   
    while ( i < length(B_values))
        s = B_values(i);
        if(i ~= length(B_values))
           i = i+1;
        else
             s = str2double(s);
             b = [b, s];
            break; 
        end   
        while(B_values(i)~= ',')
             s = strcat(s,B_values(i));
             if(i ~= length(B_values))
                 i = i+1;
             else
                break;  
             end  
        end
        s = str2double(s);
        b = [b, s];
    end
    end
end
setappdata(0,'b',b);

% --- Executes during object creation, after setting all properties.
function b_values_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valueof_n_Callback(hObject, eventdata, handles)

n = str2double(get(handles.valueof_n, 'String'));
if(n<=0 | n>4)
    msgbox('We only solve to the Forth order')
else    
setappdata(0,'n',n);
end

% --- Executes during object creation, after setting all properties.
function valueof_n_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valueof_m_Callback(hObject, eventdata, handles)

m = str2double(get(handles.valueof_m, 'String'));
if(m<0 | m>4)
    msgbox('We only solve to the Forth order')
else    
setappdata(0,'m',m);
end

% --- Executes during object creation, after setting all properties.
function valueof_m_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end












