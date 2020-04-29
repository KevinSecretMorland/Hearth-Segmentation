function varargout = toto(varargin)
% TOTO MATLAB code for toto.fig
%      TOTO, by itself, creates a new TOTO or raises the existing
%      singleton*.
%
%      H = TOTO returns the handle to a new TOTO or the handle to
%      the existing singleton*.
%
%      TOTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOTO.M with the given input arguments.
%
%      TOTO('Property','Value',...) creates a new TOTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before toto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to toto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help toto

% Last Modified by GUIDE v2.5 10-May-2019 19:02:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @toto_OpeningFcn, ...
                   'gui_OutputFcn',  @toto_OutputFcn, ...
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


% --- Executes just before toto is made visible.
function toto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to toto (see VARARGIN)

% Choose default command line output for toto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes toto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = toto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Previous.
function Previous_Callback(hObject, eventdata, handles)
% hObject    handle to Previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This button has to go back in the previous preloaded image 

if handles.currentnumb > 1 %if the current image number is > to 1
    handles.currentnumb=handles.currentnumb-1; %current image - 1
    handles.current_filename = char(handles.name(handles.currentnumb));
    handles.current_filename = [handles.path,handles.current_filename] ;
    handles.image = dicomread(handles.current_filename);

    %Display the image in the axe 1
    axes(handles.loadimgs)
    colormap(gray)
    imagesc(handles.image)
    imshow(handles.image,[])
    
    dicom_info = dicominfo(handles.current_filename);
    set(handles.edit6,'string',dicom_info.SliceLocation)
    set(handles.edit7,'string',dicom_info.InstanceNumber)
end

guidata(hObject,handles)

% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This button has to go back in the previous preloaded image 

if handles.currentnumb < handles.numofimg %if the current image number is > to number of total images
    handles.currentnumb = handles.currentnumb + 1;%current image + 1
    handles.current_filename = char(handles.name(handles.currentnumb));
    handles.current_filename = [handles.path,handles.current_filename] ;
    handles.image = dicomread(handles.current_filename);
    
    %Display image in axe 1
    axes(handles.loadimgs)
    colormap(gray)
    imagesc(handles.image)
    imshow(handles.image,[])
    
    dicom_info = dicominfo(handles.current_filename);
    set(handles.edit6,'string',dicom_info.SliceLocation)
    set(handles.edit7,'string',dicom_info.InstanceNumber)
    

end

guidata(hObject,handles)


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


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Load all the Dicom files as possible to be used for segmentation
%pop up dialog box
[name, path] = uigetfile('*.*','Choose all the Dicom files to be used for snake algorithm','MultiSelect', 'on');
handles.name = name; %Name of the file
handles.path = path; %Path of th efile
handles.current_filename = char(name(1));
handles.current_filename = [path,handles.current_filename];
handles.image = dicomread(handles.current_filename); % Read curret dicom image

%Read the Dicom info of all image to be displayed in the GUI
dicom_info = dicominfo(handles.current_filename);
set(handles.edit1,'string',dicom_info.PatientName.FamilyName) %Family name
set(handles.edit2,'string',dicom_info.PatientID) %patien ID
set(handles.edit3,'string',dicom_info.PatientBirthDate) %Birth date
set(handles.edit4,'string',dicom_info.StudyID) %Study ID
set(handles.edit5,'string',dicom_info.StudyDate) %Study date
set(handles.edit6,'string',dicom_info.SliceLocation) %Slice location
set(handles.edit7,'string',dicom_info.InstanceNumber) %Instance Number


handles.numofimg = length(name);
handles.currentnumb = 0;
handles.dicom_imgs = dicomread(handles.current_filename);
handles.currentnumb = handles.currentnumb +1;
%Transform the image to be well displayed in the axe without being too much
%lightered
axes(handles.loadimgs)
colormap(gray)
imagesc(handles.dicom_imgs)
imshow(handles.dicom_imgs,[])
guidata(hObject,handles)

% --- Executes on button press in Anonymize.
function Anonymize_Callback(hObject, eventdata, handles)
% hObject    handle to Anonymize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Anonymize the dicom image to protect the patient
dicomanon(handles.current_filename,'anonymized_Dicom.dcm');

% --- Executes on button press in DICOM_to_JPEG.
function DICOM_to_JPEG_Callback(hObject, eventdata, handles)
% hObject    handle to DICOM_to_JPEG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Transform the Dicom image to Jpeg
newimg = mat2gray(handles.image)
imwrite(newimg,'Dicom2Jpeg.jpg','Quality',100,'Mode','Lossy');

% --- Executes on button press in JPEG_to_DICOM.
function JPEG_to_DICOM_Callback(hObject, eventdata, handles)
% hObject    handle to JPEG_to_DICOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Transform the jpeg in Dicom
[name, path] = uigetfile('*.*','Choose the Jpeg file to be converted to Dicom Format')
n_path = strcat(path,name);
handles.I = imread(n_path);
dicomwrite(handles.I, 'Jpeg2Dicom.dcm');

% --- Executes on button press in Segmentation.
function Segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to Segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% [name, path] = uigetfile('*.*','Dear Theolinho choose the imagezinhas')
% n_path = strcat(path,name);
% handles.I = imread(n_path);

%Take the jpeg image to be ready for Segmentation algorithm with Snake
handles.I = imread('Dicom2jpeg.jpg');
handles.Tumor = [];

axes(handles.loadimgs2)
colormap(gray)
imagesc(handles.I)
imshow(handles.I,[])
guidata(hObject,handles)

% --- Executes on button press in PZ.
function PZ_Callback(hObject, eventdata, handles)
% hObject    handle to PZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%First mask for PZ region of the prostate
handles.maskPZ = roipoly(handles.I);% create a binary mask for PZ
guidata(hObject,handles)

% --- Executes on button press in TZ.
function TZ_Callback(hObject, eventdata, handles)
% hObject    handle to TZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Second mask for the TZ region of the prostate
handles.maskTZ = roipoly(handles.I);% create a binary mask for TZ
guidata(hObject,handles)

% --- Executes on button press in CZ.
function CZ_Callback(hObject, eventdata, handles)
% hObject    handle to CZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Third mask for the CZ region of the prostate
handles.maskCZ = roipoly(handles.I);% create a binary mask for CZ
guidata(hObject,handles)

% --- Executes on button press in Tumor.
function Tumor_Callback(hObject, eventdata, handles)
% hObject    handle to Tumor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Tumor region of the prostate
handles.Tumor = roipoly(handles.I);% create a binary mask for
guidata(hObject,handles)

% --- Executes on button press in Mask.
function Mask_Callback(hObject, eventdata, handles)
% hObject    handle to Mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%We apply the mask of PZ, TZ, and / or Tumor for Snake algorithm

figure;
imshow(handles.I,[]);
hold on;

dicom_info = dicominfo(handles.current_filename);

%Snake algorithm
% 10 iterations
handles.bTU = [];

handles.bTZ = activecontour(handles.I, handles.maskTZ, 5);
handles.bPZ = activecontour(handles.I, handles.maskPZ, 5);
handles.bCZ = activecontour(handles.I, handles.maskCZ, 5);

if (~isempty(handles.Tumor))
handles.bTU = activecontour(handles.I, handles.Tumor, 5);
visboundaries(handles.bTU,'Color','g');%Tumor is green
end

%Display it with different colors
visboundaries(handles.bTZ,'Color','r');%TZ is red
visboundaries(handles.bPZ,'Color','b');%PZ is blue
visboundaries(handles.bCZ,'Color','y');%CZis yellow

%calcul of the surface and the volume of the area found
[STZ,VTZ] = area_vol_calc(handles.bTZ,dicom_info)
[SCZ,VCZ] = area_vol_calc(handles.bCZ,dicom_info)
[SPZ,VPZ] = area_vol_calc(handles.bPZ,dicom_info) 

if (~isempty(handles.bTU))
    [STU,VTU] = area_vol_calc(handles.bTU,dicom_info)
    set(handles.edit_VTU,'string',VTU) 
    set(handles.edit_STU,'string',STU) 
end

%Display the volume and the surface calculed 
set(handles.edit_VTZ,'string',VTZ) 
set(handles.edit_VPZ,'string',VPZ) 
set(handles.edit_VCZ,'string',VCZ)  

set(handles.edit_STZ,'string',STZ) 
set(handles.edit_SPZ,'string',SPZ)
set(handles.edit_SCZ,'string',SCZ)


guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.loadimgs = hObject;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.loadimgs2 = hObject;
guidata(hObject,handles)


% --- Executes on button press in Button_3D.
function Button_3D_Callback(hObject, eventdata, handles)
% hObject    handle to Button_3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This part is the 3D reconstuction algorithm for Snake results.
%This is displayed in the axe2

axes(handles.axes2);
hold off;
cla reset
axes(handles.axes2);
%First we make a meshgrid to the size of the mask
[X,Y] = meshgrid(1:size(handles.bTZ,2),1:size(handles.bTZ,1));
hold on;

%3D reconstruction algorithm of the different results with 50 shapes and in
%the same color.

contour3(X,Y, handles.bTZ,50,'r')
contour3(X,Y, handles.bPZ,50,'b')
contour3(X,Y, handles.bCZ,50,'y')

if (~isempty(handles.bTU))
    contour3(X,Y, handles.bTU,50,'g')
end

grid on
grid minor

%Algorithm of allow the user to rotate in the workspace in the axe 2
h = rotate3d;
h.Enable = 'on';
setAllowAxesRotate(h,handles.axes2,true);
hold off;
guidata(hObject,handles);

function Anonymize_CreateFcn(hObject, eventdata, handles)



function edit_VCZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_VCZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_VCZ as text
%        str2double(get(hObject,'String')) returns contents of edit_VCZ as a double


% --- Executes during object creation, after setting all properties.
function edit_VCZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_VCZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_VTU_Callback(hObject, eventdata, handles)
% hObject    handle to edit_VTU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_VTU as text
%        str2double(get(hObject,'String')) returns contents of edit_VTU as a double


% --- Executes during object creation, after setting all properties.
function edit_VTU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_VTU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_VPZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_VPZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_VPZ as text
%        str2double(get(hObject,'String')) returns contents of edit_VPZ as a double


% --- Executes during object creation, after setting all properties.
function edit_VPZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_VPZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_VTZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_VTZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_VTZ as text
%        str2double(get(hObject,'String')) returns contents of edit_VTZ as a double


% --- Executes during object creation, after setting all properties.
function edit_VTZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_VTZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_SCZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_SCZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_SCZ as text
%        str2double(get(hObject,'String')) returns contents of edit_SCZ as a double


% --- Executes during object creation, after setting all properties.
function edit_SCZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_SCZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_STU_Callback(hObject, eventdata, handles)
% hObject    handle to edit_STU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_STU as text
%        str2double(get(hObject,'String')) returns contents of edit_STU as a double


% --- Executes during object creation, after setting all properties.
function edit_STU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_STU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_SPZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_SPZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_SPZ as text
%        str2double(get(hObject,'String')) returns contents of edit_SPZ as a double


% --- Executes during object creation, after setting all properties.
function edit_SPZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_SPZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_STZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_STZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_STZ as text
%        str2double(get(hObject,'String')) returns contents of edit_STZ as a double


% --- Executes during object creation, after setting all properties.
function edit_STZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_STZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
