function [ prev ] = Gibbs( alpha,beta )
% Implementation of the Gibbs Sampler

eta = .99;
theta = .97;

A=49;
B=951;

M2 = 20000; %Iterations

X = [];
Y = [];
prev = []; %Prevelance

prev(1) = 0;

for m = 1:M2

X(m) = binornd(A,(prev(m).*eta)./((prev(m).*eta)+(1-prev(m)).*(1-theta)));
Y(m) = binornd(B,(prev(m).*(1-eta))./((prev(m).*(1-eta))+(1-prev(m)).*theta));

prev(m+1) = betastat(X(m) + Y(m) + alpha, A + B - X(m) - Y(m) + beta);

end


end

