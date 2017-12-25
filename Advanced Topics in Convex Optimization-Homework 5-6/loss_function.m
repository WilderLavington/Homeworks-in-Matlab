function [ J] = loss_function(Y,w,X,l)
J = 0;
for i = 1:3065
   J = J + log(1+exp( (Y(i,1)*w'*X(i,:)')))+l*w'*w;
end
end

