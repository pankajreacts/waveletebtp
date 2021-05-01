%% For Inner Outer race fault and for Normal
%% For Inner Race Fault
% name = 'InnerRaceFault_';
% testfiledir = 'C:\Users\Acer\Desktop\Data\12k Drive End Bearing Fault Data\Inner race\';
%% For Outer Race Fault
 name = 'OuterRaceFault_';
 testfiledir = 'C:\Users\Acer\Desktop\Data\12k Drive End Bearing Fault Data\outer race\';
%% For Normal
%  name = 'baseline_';
%  testfiledir = 'C:\Users\Acer\Desktop\Data\Normal Baseline Data\';
%% For Rolling bearing Fault
  name = 'RollingFault_';
  testfiledir = 'C:\Users\Acer\Desktop\Data\12k Drive End Bearing Fault Data\ball race\';

matfiles = dir(fullfile(testfiledir, '*.mat'));
nfiles = length(matfiles);
    
for i = 1 : nfiles
     fileNameWithoutMat = matfiles(i).name(1:3);
     fid = fopen( fullfile(testfiledir, matfiles(i).name) );
     dataInner = load(fullfile(testfiledir, matfiles(i).name));

     bearing.gs = eval(['dataInner.', 'X',fileNameWithoutMat, '_DE_time']); % vibration signal
     % Execute this section to save

      save([name  num2str(i)], 'bearing'); 
      clear dataInner;
      %close now
      fclose(fid);
end
disp(["Saved ", name, "files"]);





