%{
Pre-processesing script for raw EEG data: low-pass filter
50 Hz,average reference, epoching; uses EEGLAB.

(c) Oana Cucu, October 2019. oana.cucu@bristol.ac.uk
%}

addpath('/Users/gigel/Documents/MATLAB/eeglab13_6_5b');
files=dir('*.eeg');
h=waitbar(0,'Please wait...');

for i=1:length(files)
waitbar(i/length(files))

[token,remain]=strtok(files(i).name,'.');

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_fileio(files(i).name);
EEG.setname=token;
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG,1);
EEG = eeg_checkset( EEG );
EEG=pop_chanedit(EEG, 'lookup','/Users/gigel/Documents/MATLAB/eeglab13_6_5b/plugins/dipfit2.3/standard_BESA/standard-10-5-cap385.elp');
EEG = eeg_checkset( EEG );
EEG = pop_eegfiltnew(EEG, [], 50, 264, 0, [], 1);
EEG = eeg_checkset( EEG );
EEG = pop_reref( EEG, []);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S 11'  'S 12'  'S 13'  'S 14'  'S 15'  'S 16'  'S 21'  'S 22'  'S 23'  'S 24'  'S 25'  'S 26'  'S 31'  'S 32'}, [0  10], 'newname', strcat(token,' EEG epochs'), 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG);
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',strcat(token,' epochs.set'),'filepath','/Users/gigel/Documents/Speech EEG/Experiment 3 (final)');
EEG = eeg_checkset( EEG );
end

close(h);
