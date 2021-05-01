%% Generating data for Machine Learning
% Generating Training data 
[TrainX, TrainY] = generateWaveletData('C:\Users\Acer\Desktop\btechprojectdata\wavelet data\Train data\', false);
% Generating Test data
[TestX, TestY] = generateWaveletData('C:\Users\Acer\Desktop\btechprojectdata\wavelet data\Test data\', false);

%% Training goes here 
tic
X = TrainX; 
Y = cellstr(TrainY');
Mdl = fitcecoc(X,Y);

Mdl.ClassNames

CodingMat = Mdl.CodingMatrix;

Mdl.BinaryLearners{1};   % The first binary learner
error = resubLoss(Mdl)
sum(predict(Mdl, TrainX) ~= TrainY)*100/length(TrainY)
toc
%% Testing goes Here
% predict(Mdl, TestX)
sum(predict(Mdl, TestX) ~= TestY)*100/length(TestY)