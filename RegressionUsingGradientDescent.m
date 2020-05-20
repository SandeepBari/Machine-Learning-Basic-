clc;
clear all;
close all;

x = load('input.txt');
y = load('output.txt');
w = 1;       %feature/attribute/basis
b = 0;        %bias
err = 0;     %error function 
dw = 0;     %gradient partial derivate wrt w
db=0;       %%gradient partial derivate wrt w


for t = 1:1000
    for i = 1:length(y)
        
        r = x(i);
        s = y(i);
        n = (w*r + b);
        a = logsig(n);  
        fx = a;
        o(i) = a;
        dw(i) = (fx-s)*fx*(1-fx)*r;
        db(i) = (fx-s)*fx*(1-fx);
    end
    
    w = w - 0.01*(mean(dw));    %Gradient descent wnext=wcurrent-alpha*mean of gradient dw
    b = b - 0.01*(mean(db));      %Gradient descent bnext=bcurrent-alpha*mean of gradient db
    err = 0.5*(mean(fx)-s)^2;     %Loss function=MSE
    ww(t) = w;
    err1(t) = err;
end

figure(1);
plot(ww,err1);
xlabel('----weight----');
ylabel('----error----');

figure(2);
plotregression(y,o)
xlabel('----target----');
ylabel('----estimated----');

