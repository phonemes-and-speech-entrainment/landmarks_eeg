clear;
address='/Users/gigel/Documents/Speech EEG/Experiment 3 (final)';
addpath('/Users/gigel/Documents/MATLAB/eeglab13_6_5b');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

files=dir('*.set'); %use before running the code

%load all data for each participant
for i=1:length(files)
    %if i==2 || i==9 || i==10 || i==12
    %    continue
    %end
    EEG=pop_loadset(files(i).name, address);
    [ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG);
end;

%extract relevant info (subject, channel, trial, and truncate time series)
n=size(ALLEEG,2);
k=size(ALLEEG(1).data,1);
l=size(ALLEEG(1).data,2); %-500; %remove first 500 ms
p=size(ALLEEG(1).data,3);

%{
Data=zeros(n,k,l,p);
for i = 1:n
    Data(i,:,:,:)=ALLEEG(i).data(:,501:end,:);
end;
%}

Data=zeros(n,k,l,p);
for i = 1:n
    Data(i,:,:,:)=ALLEEG(i).data;
end;

%extract information about each event (trial number, event code) for each
%participant
Eveinfo=zeros(n,p);

for i = 1:n
    for j = 1:p
        if ALLEEG(i).event(j).type>=100
            ALLEEG(i).event(j)=[];
        end
        [token,remain]=strtok(ALLEEG(i).event(j).type);
        Eveinfo(i,j)=str2double(remain);
    end
end

%sort events ascendingly by their code number
Indices=zeros(n,p);
Eveinfo2=zeros(n,p);

for i = 1:n
    a=Eveinfo(i,:);
    [b,indx]=sort(a,'ascend');
    Indices(i,:)=indx;
    Eveinfo2(i,:)=b;
end;

%index data for each participant in the order of the events
Data2=zeros(n,k,l,p);

for i = 1:n
    indx=Indices(i,:);
    Data2(i,:,:,:)=Data(i,:,:,indx);
end;

%sort data matrix in streams per trials and permute to get that specific
%order
Data3=reshape(Data2, size(Data2,1), size(Data2, 2), size(Data2,3), 10, size(Data2,4)/10);

Datanew=permute(Data3,[1 2 3 5 4]);