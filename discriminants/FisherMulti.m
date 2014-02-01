function [ out ] = FisherMulti( tr, Y, te )
%Fishers Linear Discriminant Analysis for Multiple classes One against all


out = zeros(size(te,1),1);
for k = 1:size(te,1)
    v = zeros(1,5);
    for i = 1:5
        d = tr(Y(:,i)==1,:);
        
    
        r = tr;
        r(Y(:,i)==1,:) = [];
        
    
        p(i) = sum(Y(:,i))/size(Y,1);
    
        dcov = cov(d);
        rcov = cov(r);
        dmean = mean(d);
        rmean = mean(r);
    
        w =(dmean-rmean)*inv((dcov+rcov));
        x = te(k,:);
        w0 = -0.5*(dmean+rmean)*inv((dcov+rcov))*(dmean-rmean)' - log(p(i)/(1-p(i)));
        v(i) = (w*x' + w0)/det(w);
    end
[id,class] = max(v);

out(k) = class;
       

end

        


end


