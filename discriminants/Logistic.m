function [ out ] = Logistic( tr, Y, te )
%Logistic Regression for Multiple Classes

out = zeros(size(te,1),5);
logreg = mnrfit(tr,Y); %Perform Multinomial Logistic Regression
%The first row would be interecepts and the last rows would be the slopes
%of the model according to the number of features in training data.
%The columns represents the output classes, there are 4
%because the 5th one is taken to be the reference.

for i = 1:5
p(i) = sum(Y(:,i))/size(Y,1);
end

for k = 1:size(te,1)
    total = 0;
    v = zeros(1,5);
    x = te(k,:);
    for i = 1:4
      
       total = total + exp(logreg(1,i)+log(p(i)/(1-p(i))) + x*logreg(2:8,i)); 
       
    end
    
    for i = 1:4
        
       n = exp(logreg(1,i)+log(p(i)/(1-p(i))) + x*logreg(2:8,i));
       v(:,i) = n*inv(1+total); %Computing the first four probablities
       
    end
    
    v(:,5) = inv(1+total); %The fifth is computed via a different method

    out(k,:) = v;
end
       
             

end

