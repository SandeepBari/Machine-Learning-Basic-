clear all;
close all;
clc;

%% creation and training of the neural network using perceptron for XOR logic
%Network consists of 3 variables x1,x2,x3 and four samples. So data matrix
% is 4*3 size as below

X = [ 0 0 1;
0 1 1;
1 0 1;
1 1 1;
];

D = [ 0 1 1 1];                      % XOR target 4 cases
W1 = 2*rand(4, 3) - 1;      %( No of samples, No of feature variables)
W2 = 2*rand(1, 4) - 1;      % second stage weights for w1.y1(1)+w2.y1(2)+w3.y1(3)+w4.y1(4)
alpha=0.9;                          % learning rate between 0 and 1

for epoch = 1:10000         % train
N = 4;                                   % no of patterns/samples

for k = 1:N
x = X(k, :)'; 			% Take one pattern and make a col vector [ x1 x2 x3]'
d = D(k); 			% corresponding target
v1 = W1*x; 			% Find output V of all 4 neurons in hidden layer for this pattern
%y1 = logsig(v1);  
y1=1./(1+exp(-v1)); 	%sigmoid activation function for hidden
v2 = W2*y1; 		% find output of neuron in the final/output layer
%y = logsig(v2);
y=1./(1+exp(-v2));		%sigmoid activation function for output






e  = d - y; 			% simple error=target-actual
delta = y.*(1-y).*e;		% delta of output stage
e1  = W2'*delta; 		% Propogate back this delta thr weight matrix to propogate the error 
% to all the four neurons of hidden layer
delta1 = y1.*(1-y1).*e1; 	% find delta at all 4 neurons from e1 (propogated back)
dW1 = alpha*delta1*x'; 	% update value for hidden layer neurons
W1 = W1 + dW1;		% update weights for hidden layer neurons
dW2 = alpha*delta*y1'; 	%update value for output layer neuron
W2 = W2 + dW2; 		%update weights for output layer neuron

end

error(epoch)=abs(e);

end

plot(error);
ylabel('Error');
xlabel('no of iterations');

%Testing of the neural network using perceptron for XOR logic
% Testing

X = [ 0 1 1;
    0 0 1;
    1 0 1;
    1 1 1;
    ];

N = 4;  			 % inference

for k = 1:N
x = X(k, :)';
v1 = W1*x;
%y1 = logsig(v1);
y1=1./(1+exp(-v1)); 	%sigmoid activation function for hidden
v2 = W2*y1;
%y(k) = logsig(v2);
y(k)=1./(1+exp(-v2)); 	%sigmoid activation function for hidden
end 
disp(y)
