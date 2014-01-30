function [ out ] = RegBayes( tr, l , y)
%NOTE: Should be called with MAIN file - GaussianClassifiersMAIN
%Regularized discriminant analysis for Gaussian Classifier

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

S = p(1)*covb1 + p(2)*covb2 + p(3)*covb3;



lcov1 = ( ((1-l)*sum(n)*covb1) + l*sum(n)*S) / ( (1-l)*n(1) + l*sum(n));
lcov2 = ( ((1-l)*sum(n)*covb2) + l*sum(n)*S) / ( (1-l)*n(2) + l*sum(n));
lcov3 = ( ((1-l)*sum(n)*covb3) + l*sum(n)*S) / ( (1-l)*n(3) + l*sum(n));


lycov1 = (1-y)*lcov1 + y*(sum(eig(lcov1))/4)*eye(4);
lycov2 = (1-y)*lcov2 + y*(sum(eig(lcov2))/4)*eye(4);
lycov3 = (1-y)*lcov3 + y*(sum(eig(lcov3))/4)*eye(4);

out = [];

for m = 1:size(tr)
g = [];

    x = tr(m,1:4);
    
   
    g(1) = log(p(1)) - sum(log(det(lycov1))) -0.5*((x - meanb(1,:))*inv(lycov1)*(x-meanb(1,:))');
    g(2) = log(p(2)) - sum(log(det(lycov2))) -0.5*((x - meanb(2,:))*inv(lycov2)*(x-meanb(2,:))');
    g(3) = log(p(3)) - sum(log(det(lycov3))) -0.5*((x - meanb(3,:))*inv(lycov3)*(x-meanb(3,:))');
    
[id,class] = max(g);
out(m) = class;
end






end

