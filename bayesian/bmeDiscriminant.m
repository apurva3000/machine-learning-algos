[X1,X2] = meshgrid(0:10,0:10);
X = [X1(:)';X2(:)'];

mean1 = [1,1];

mean21 = [5,10];
mean22 = [10,20];

a = [1,2;2,1];
aa = a*a;

b = [2,-4;-4,2];
bb = b*b;
b1 = [10,20;20,10];
bb1 = b1*b1;

p1=0.4;
p2=0.6;

p11=0.1;
p22=0.9;

g1 = Discri15(X,aa,bb,mean1,mean21,p1,p2);

g11= Discri15(X,aa,bb,mean1,mean21,p11,p22);

g2= Discri15(X,aa,bb,mean1,mean22,p1,p2);

g3 = Discri15(X,aa,bb1,mean1,mean21,p1,p2);

g4 = Discri15(X,aa,bb1,mean1,mean22,p1,p2);

g5 = Discri15(X,aa,aa,mean1,mean21,p1,p2);

g6 = Discri15(X,aa,aa,mean1,mean22,p1,p2);

g7 = Discri15(X,bb,bb,mean1,mean22,p1,p2);

g71 = Discri15(X,bb,bb,mean1,mean22,p11,p22);

Gimage1 = reshape(g1,11,11);
Gimage11 = reshape(g11,11,11);
Gimage2 = reshape(g2,11,11);
Gimage3 = reshape(g3,11,11);
Gimage4 = reshape(g4,11,11);
Gimage5 = reshape(g5,11,11);
Gimage6 = reshape(g6,11,11);
Gimage7 = reshape(g7,11,11);
Gimage71 = reshape(g71,11,11);

figure;
imagesc(Gimage1), colorbar;
title('mean and cov normal');
figure;
imagesc(Gimage11), colorbar;
title('priors changed');
figure;
imagesc(Gimage2), colorbar;
title('cov same, mean of class 2 increased');
figure;
imagesc(Gimage3), colorbar;
title('mean same, cov of class 2 changed(M inc)');
figure;
imagesc(Gimage4), colorbar;
title('mean and cov both inc');
figure;
imagesc(Gimage5), colorbar;
title('passing cov1 only i.e. equal');
figure;
imagesc(Gimage6), colorbar;
title('change of mean but cov1 only same');
figure;
imagesc(Gimage7), colorbar;
title('passing cov2 only same');
figure;
imagesc(Gimage71), colorbar;
title('cov2 passes, priors changed');