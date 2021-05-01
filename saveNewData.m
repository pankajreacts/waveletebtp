function [] = saveNewData(name, testfiledir, startingIndex)
    % name is OuterRaceFault_ for Outer Race Fault, RollingFault_ for Rolling
    % Bearing Fault, InnerRaceFault_ for Inner Race Fault, baseline_ for
    % Normal,startIndex: will start saving name from startingIndex

    matfiles = dir(fullfile(testfiledir, '*.mat'));
    nfiles = length(matfiles); 
    for i = 1 : nfiles
         fileNameWithoutMat = matfiles(i).name(1:3);
         fid = fopen( fullfile(testfiledir, matfiles(i).name) );
         dataInner = load(fullfile(testfiledir, matfiles(i).name));

         bearing.gs = eval(['dataInner.', 'X',fileNameWithoutMat, '_FE_time']); % vibration signal
         % Execute this section to save

          save([name  num2str(startingIndex)], 'bearing'); 
          startingIndex = startingIndex + 1;
          clear dataInner;
          %close now
          fclose(fid);
    end
    disp(["Saved ", name, "files"]);
end