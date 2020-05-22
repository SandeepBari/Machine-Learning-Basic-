clc;
clear all;
close all;
 
load fisheriris;
x=meas(51:150,3:4);
y=species(51:150,:);
mysvm=fitcsvm(x,y);
 
sv=mysvm.SupportVectors;
figure
gscatter(x(:,1),x(:,2),y);
hold on;
 
plot(sv(:,1),sv(:,2),'ko','Markersize',10);
legend('vericolor','virginica','Support Vector');
hold off;
xnew=[6.5,2.25];
[label ,scores] = predict(mysvm,xnew);