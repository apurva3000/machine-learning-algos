[X1,X2] = meshgrid(0:10,0:10);
X = [X1(:)';X2(:)'];

mean1 = 1;

mean21 = 5;
mean22 = 10;

a = [1,2;2,1];
aa = a*a;

b = [2,4;4,2];
bb = b*b;
b1 = [10,20;20,10];
bb1 = b1*b1;

p1=0.5;
p2=0.5;
p11 = 0.3;
p22 = 0.7;
l1 = [0,10;10,0];
l2 = [1,0;0,1];

g1 = risk16(X,aa,bb,mean1,mean21,p1, p2,l1);

g2 = risk16(X,aa,bb,mean1,mean21,p1, p2,l2);

g3 = risk16(X,aa,bb,mean1,mean21,p11, p22,l2);

g4= risk16(X,aa,bb,mean1,mean22,p1, p2,l1);

g5 = risk16(X,aa,bb1,mean1,mean21,p1, p2,l1);

g6 = risk16(X,aa,aa,mean1,mean21,p1, p2,l1);

g7 = risk16(X,aa,aa,mean1,mean21,p11, p22,l1);

g8 = risk16(X,bb,bb,mean1,mean21,p1, p2,l1);

g10 = risk16(X,bb,bb,mean1,mean22,p1, p2,l1);



Gimage1 = reshape(g1,11,11);
Gimage2 = reshape(g2,11,11);
Gimage3 = reshape(g3,11,11);
Gimage4 = reshape(g4,11,11);
Gimage5 = reshape(g5,11,11);
Gimage6 = reshape(g6,11,11);
Gimage7 = reshape(g7,11,11);
Gimage8 = reshape(g8,11,11);
Gimage10 = reshape(g10,11,11);


figure;
imagesc(Gimage1), colorbar;
title('mean and cov normal');
figure;
imagesc(Gimage2), colorbar;
title('loss matrix swapped');
figure;
imagesc(Gimage3), colorbar;
title('prior probablities changed');
figure;
imagesc(Gimage4), colorbar;
title('mean of class 2 increased');
figure;
imagesc(Gimage5), colorbar;
title('cov of class 2 changed(M inc)');
figure;
imagesc(Gimage6), colorbar;
title('pass only cov1 i.e. equal');
figure;
imagesc(Gimage7), colorbar;
title('passing cov1 only i.e. equal, priors changed');
figure;
imagesc(Gimage8), colorbar;
title('passing cov2 only');
figure;
imagesc(Gimage10), colorbar;
title('passing cov2 only, mean of class 2 changed');