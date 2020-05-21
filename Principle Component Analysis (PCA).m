clc;
clear all;
close all;
 
x1=[4.1 2.1 .5 1.5 3.6 5.2 7.3 2.4 .8 6.2];
x2=[1.3 4.7 .33 5.7 2.8 7.4 8.4 3.6 .9 2.8];
 
x1=x1';
x2=x2';
display(x1);
display(x2);
plot(x1,x2,'+');
 
xmean=mean(x1);
ymean=mean(x2);
display(xmean);
display(ymean);
adjmat=[(x1-xmean) (x2-ymean)];
covmat=cov(adjmat);
 
[v e]=eig(covmat);
display(v);
display(e);
 
eigmax=max(diag(e));
[indx indy]=find(e==eigmax);
eiganv=v(:,indy);
display(eiganv);
 
pc1=eiganv'*adjmat';
display(pc1);
 
orgmat=(eiganv)*pc1;
final=[orgmat(1,:)+ xmean ; orgmat(2,:)+ymean]';





plot(x1,x2,'*b');
hold on;
plot(final(:,1),final(:,2),'--b');
hold on;
 
eigmax=min(diag(e));
[indx indy]=find(e==eigmax);
eiganv=v(:,indy);
display(eiganv);
pc2=eiganv'*adjmat';
display(pc2);
 
orgmat=(eiganv)*pc2;
final=[orgmat(1,:)+ xmean ; orgmat(2,:)+ymean]';
plot(x1,x2,'*r');
hold on;
plot(final(:,1),final(:,2),'--g');
hold on;
legend('data','PC1','PC2','Location','southeast');
hold on;
