function [ y ] = myRBFn( x1, x2, r )
%% INPUTS 
% x1 vector of size 1xN
% x2 vector of size 1xN
%% OUTPUTS
% y vector of size 1xN

%% Weight setting
G=ones(4,3);
x=[1 0 0 1;1 1 0 0]';
t=[1 1;0 0];
d=[0 1 0 1]';

for i=1:2
    for j=1:4
        G(j,i)=exp(-norm(x(j,:)-t(i,:)).^2);
    end
end

w = inv(G'*G)*G'*d; % Getting the final value of w
%% Getting the output
x=[x1;x2]'; %Taking the transpose for x and y cartesian coordinates to be rowsise, for subtraction with t1 and t2
t1=[1 1];
t2=[0 0];
g1=zeros(1,size(x,1));
g2=zeros(1,size(x,1));

for k=1:size(x,1) % passing datas through the RBF network
    g1(k)=exp(-(norm(x(k,:)-t1).^2)/r);
    g2(k)=exp(-(norm(x(k,:)-t2).^2)/r);
end

y=w(1)*g1+w(2)*g2 + w(3); %w(1)=w(2)=w , w(3) = b


end

