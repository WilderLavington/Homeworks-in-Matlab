function [ dJ ] = gradient_loss_function(X,w,Y,l)
mu = zeros(3065,1);
for i = 1:3065
    mu(i,1) = sigmoid(Y(i,1)*w'*X(i,:)');
end
dJ = -X'*(Y.* (1-mu))+2*l*w;
end

