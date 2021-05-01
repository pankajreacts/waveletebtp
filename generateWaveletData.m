function [X, Y] = generateWaveletData(testfiledir, flag)
%testfiledir would be like this 'C:\Users\Acer\Desktop\btechprojectdata\for
%train data\' , flag is true if name of files is to be printed otherwise it
%is false
    N = 3;
    X=[]; 
    Y = [];

    % For opening multiple files 
    matfiles = dir(fullfile(testfiledir, '*.mat'));
    nfiles = length(matfiles);
    %
    for i = 1 : nfiles
       if(flag == true) 
           disp(matfiles(i).name); 
       end
       fid = fopen( fullfile(testfiledir, matfiles(i).name) );
       firstThreeLetter = extractBetween(matfiles(i).name, 1, 3);
       
       if firstThreeLetter == "bas"
          Y = [Y; "base"];
       elseif firstThreeLetter == "Inn"
        Y = [Y; "Inner"];
       elseif firstThreeLetter == "Out"
        Y = [Y; "Outer"];
       else
           Y = [Y; "Ball"];
       end

    %   data{i} = fscanf(fid,'%c');
        dataInner = load(fullfile(testfiledir, matfiles(i).name));
        x = dataInner.bearing.gs;
        feature = getAllFeatures(x, N);
       % feature = getFeaturesWPT(x, N);
        X = [X; feature];

        clear dataInner;
        %close now
       fclose(fid);
    end
    disp("Data Generated");
end