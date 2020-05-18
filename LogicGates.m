clc;
close all;
clear all;

choice=input('case');

x1=[0 0 1 1];
x2=[0 1 0 1];

w1=1;
w2=1;

disp('mp neuron mode1:-');
switch choice
    
    case 'AND'
        theta=w1+w2;
        inverse=0;
        
    case 'NOT'
        x2=[0 0 0 0];
        w2=0;
        x1=~x1;
        theta=1;
        inverse=0;
        
    case 'OR'
        theta=max(w1,w2);
        inverse=0;
        
    case 'ANDNOT'
        x2=~x2;
        theta=w1+w2;
        inverse=0;
        
    case 'NOR'
        theta=0;
        inverse=1;
        
  

  case 'NAND'
        theta=1;
        inverse=1;
end
    
%sigma= w1.x1+w2.x2;
x=[x1;x2];
w=[w1;w2];
sigma=w'*x;

for i=1:4
    if(inverse==0)
        if sigma(i)>=theta
            NN(i)=1;
        elseif sigma(i)<theta
            NN(i)=0;
        end
    end

     if(inverse==1)
        if sigma(i)<=theta
            NN(i)=1;
        elseif sigma(i)>theta
            NN(i)=0;
        end
     end
end 

TT=[x'     NN'];

disp('truth table');
disp(choice);
disp(TT);
disp('theta=');
disp(theta);
