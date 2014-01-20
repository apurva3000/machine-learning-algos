function [ g ] = risk16( XX, cov1, cov2, mu1, mu2, p1, p2, l )
%Bayes minimum risk classifier - should be called with bayesMinRisk
%cov1,cov2 - Covariances of two data classes
%mu1,mu2 - Means of two data classes
%p1,p2 prior probablities of two classes
%l - loss matrix

invcov1=inv(cov1);
invcov2=inv(cov2);

detcov1=det(cov1);
detcov2=det(cov2);


g = zeros(size(XX,2),1);
f = zeros(4,1);
for i  = 1:size(XX,2)
    x = XX(:,i);
    %v1=-0.5*((X-mu1)'*invcov1*(X-mu1))-0.5*log(detcov1)+log(p1);
    %v2=-0.5*((X-mu2)'*invcov2*(X-mu2))-0.5*log(detcov2)+log(p2);

    v1 = (((det(cov1))^-0.5)*exp(-0.5*((x-mu1)'*inv(cov1)*(x-mu1))))*p1;
    v2 = (((det(cov2))^-0.5)*exp(-0.5*((x-mu2)'*inv(cov2)*(x-mu2))))*p2;
    
    r1 = l(1,1)*v1+ l(1,2)*v2;
    r2 = l(2,1)*v1+ l(2,2)*v2;
    
    if(r1<r2)
        g(i) = 1;
    else
        g(i)=2;
    end
    
end

end

