clear all; close all; clc;

% Define inputs, outputs, weights and learning rate
X = [-1 -1 1; -1 1 1; 1 -1 1; 1 1 1];
% Y = [-1 -1 -1 1]; % AND
% Y = [1 1 1 -1];  % NAND
% Y = [-1 1 1 1];    % OR
% Y = [1 -1 -1 -1]; % NOR
Y = [-1 1 1 -1];  % XOR
w = [0.1 0.1 -0.1];
rate = 0.0001; % learning rate
max_iter = 1000000; % max number of iterations
k = 0; % define index for while loop

% Update weights if the Error (Y-Y_new) is greater than 0 
while k<max_iter
    
    Y_new = w*X';
    Error = Y - Y_new;
    
    if abs(Error)~= 0
       w = w + Error*X*rate*10^(-1);
    end    
    
     k = k+1;
     Errork{k} = Error;
     
     if k>1
        if Errork{k-1}-Error<0.000000001
            msg = sprintf('Perceptron converged in %d iterations',k);
            disp(msg);
            disp('---------------------------------------------------');
            disp('Logic gate output:');
            disp(hardlim((Y_new)));
            break;
        elseif k==max_iter-1
            msg = sprintf('Perceptron did not converge in %d iterations',k);
            disp(msg);
            break;
        end
     end
     

     
end

figure;
plot(X(:,1),-(w(1)/w(2))*X(:,1)-(w(3)/w(2)));
xlabel('X1');
ylabel('X2');
title('Parameter Space (with XOR Gate Classes)')
hold on;
gscatter(X(:,1),X(:,2),Y);
