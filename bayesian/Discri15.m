%Should be called with main file - bmeDiscriminant
function [ g ] = Discri15( X,cov1,cov2,mean1,mean2,p1,p2 )
%Discriminant function for two classes Bayes Minimum Error


inv1 = inv(cov1);
inv2 = inv(cov2);
g = zeros(size(X,2),1);
A = (inv1 - inv2)*0.5;
B = mean1*inv1 - mean2*inv2;
C = ((mean2*inv2*mean2')*0.5)-((mean1*inv1*mean1')*0.5) + (.5* log(det(cov2))) - (.5*log(det(cov1))) + log(p1/p2);

for i = 1:size(X,2)
    XX = X(:,i);
    g(i) = XX'*A*XX +B*XX+C;
end
end