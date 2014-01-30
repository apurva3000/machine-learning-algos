function [ out ] = Naive( tr )
%NOTE: Should be called with MAIN file - GaussianClassifiersMAIN
%Naive Bayes implementation, the attributes are assumed to be independent
% That means that only diagonal elements are present in the covariance
% matrix

ins = histc(tr(:,5),unique(tr(:,5)));
p(1) = ins(1)/sum(ins);
p(2) = ins(2)/sum(ins);
p(3) = ins(3)/sum(ins);

meanb(1,:) = mean(tr(tr(:,5)==1,1:4));
meanb(2,:) = mean(tr(tr(:,5)==2,1:4));
meanb(3,:) = mean(tr(tr(:,5)==3,1:4));

sigma(1,:) = diag(cov(tr(tr(:,5)==1,1:4)));
sigma(2,:) = diag(cov(tr(tr(:,5)==2,1:4)));
sigma(3,:) = diag(cov(tr(tr(:,5)==3,1:4)));


out = [];

for m = 1:size(tr)
g = [];
for c = 1:3
    x = tr(m,1:4);
   g(c) = log(p(c)) - sum(log(sigma(c,:))) -0.5*(((x - meanb(c,:)).^2)/sigma(c,:))
    
end
[id,class] = max(g);
out(m) = class;
end








end

