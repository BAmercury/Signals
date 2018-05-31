%init global variables
X = 0;

files = dir('C:\Users\Tuf55912\Downloads\Lab 8\Lab 8');
for file = files' %incrementing through all files
    MVC_data = importdata('Lab8_MVC00T{X}.lvm', 23);
    %Start saving some variables
    force=MVC_data.data(:,2); %set varibles to the columns/rows you wish. 'MVC_50_1.data' is your structure.
    EMG=MVC_data.data(:,3);
    time=MVC_data.data(:,1);
    
    
  
    
    
%     Psuedocode:
%     X = X + 1 %incremental variable
%     files = dir(DIRECTORY YOU ARE WORKING IN, folder)
%     %To get name, to name file:
%     name = files(X %Increment this as time goes on, to get through each file).name, this will give you filename you can format it as a string then
    