
figID = figure('Color',[1 1 1]);
hold on; 
plot(pre','-r+');
plot(TestSetX(:,end),'-b.');
plot(pre'-TestSetX(:,end),'-gx');
legend('Prediction','Original','error')

xlim([0 length(pre)]);
box on;
xlabel('Time(min)');
ylabel('Power');
grid on;