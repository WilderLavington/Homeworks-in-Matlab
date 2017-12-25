function current_error = error_tracking(w,x,y)
    predicttrain = zeros(length(y),1);
    for i = 1:length(y)
        predicttrain(i,1) = sigmoid(w'*x(i,:)');
    end
    for i = 1:length(y)
        if predicttrain(i,1) < .5
            predicttrain(i,1) = 0;
        elseif predicttrain(i,1) >= .5
            predicttrain(i,1) = 1;
        end
    end
    for i = 1:length(y)
        if y(i,1) == -1
            y(i,1) = 0;
        end
    end
    current_error = sum(abs(predicttrain - y))/length(y);
end