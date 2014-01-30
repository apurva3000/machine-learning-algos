function [ out ] = Bayes( tr )
%NOTE: Should be called with MAIN file - GaussianClassifiersMAIN
%Gaussian Classifer with min value of variance for each attribute

n = histc(tr(:,5),unique(tr(:,5)));
p(1) = n(1)/sum(n);
p(2) = n(2)/sum(n);
p(3) = n(3)/sum(n);



meanb(1,:) = mean(tr(tr(:,5)==1,1:4));
meanb(2,:) = mean(tr(tr(:,5)==2,1:4));
meanb(3,:) = mean(tr(tr(:,5)==3,1:4));


covb1 = cov(tr(tr(:,5)==1,1:4));
covb2 = cov(tr(tr(:,5)==2,1:4));
covb3 = cov(tr(tr(:,5)==3,1:4));


 for a = 1:4
        ncovb1 = covb1 + (cov(tr(tr(:,5)==1,a))*eye(4)*cov(tr(tr(:,5)==1,a)))/100;
        ncovb2 = covb2 + (cov(tr(tr(:,5)==2,a))*eye(4)*cov(tr(tr(:,5)==2,a)))/100;
        ncovb3 = covb3 + (cov(tr(tr(:,5)==3,a))*eye(4)*cov(tr(tr(:,5)==3,a)))/100;
 end


 out = [];

for m = 1:size(tr)
g = [];

    x = tr(m,1:4);
    
   
    g(1) = log(p(1)) - sum(log(det(ncovb1))) -0.5*((x - meanb(1,:))*inv(ncovb1)*(x-meanb(1,:))');
    g(2) = log(p(2)) - sum(log(det(ncovb2))) -0.5*((x - meanb(2,:))*inv(ncovb2)*(x-meanb(2,:))');
    g(3) = log(p(3)) - sum(log(det(ncovb3))) -0.5*((x - meanb(3,:))*inv(ncovb3)*(x-meanb(3,:))');
    
[id,class] = max(g);
out(m) = class;
end


end

