% Training and testing LN-TPSVR using SGD 
clear all
close all 
load photovoltaic
num = 9600;
step = 1;
TrainingSetX = [];
for i=1:num
    temp = photovoltaic(i:step+i,1);

TrainingSetX = [TrainingSetX;temp'];
end

 
 
% parameters.M = 10; 
parameters.epoch =5; % #epochs
parameters.B = 200; 
parameters.scale = 250; % rbf kernel scale
parameters.lambda = 1e-4; % optimization's lambda 
parameters.epsilon = 0.01;

tic 

[TrainingSetX,inputps] = mapminmax(TrainingSetX'); % 归一化
TrainingSetX = TrainingSetX';   % 归一化
train= TrainingSetX;   
TestSetX=train;
model = bsgdtrain(train,parameters);
disp(['bsgd trainining time: ' num2str(toc)]) 

tic 
pre = bsgdtest(TestSetX,model);
%err = abs(pre'-TestSetX(:,end));
%mae = sum(abs(err))/num

mae=sum(abs(TestSetX(:,end)-pre'))/num
mape=sum(abs(TestSetX(:,end)-pre')./TestSetX(:,end))/num
rmse=sqrt(sum(TestSetX(:,end)-pre').^2)/num
sep=rmse/(sum(TestSetX(:,end)-pre'))/num

disp(['bsgd testing time: ' num2str(toc)]) 

%figure
%plot (TestSetX(:,end),'r*');
%hold on
% plot (pred_y ,'k>')
%plot (pre,'k.')
% plot (err,'c+')
sample_plot;
