% Use the myRBFn function to use the radial basis functions from a generated meshgrid
clc;
%imagesc(X(1,:),Y(:,1),flipud(y));

[X,Y] = meshgrid( [-1:0.1:2] , [2:-0.1:-1] );
testdata = [ reshape(X,1,[]) ; reshape(Y,1,[]) ];
for r=0.1:.5:3
    y = myRBFn(testdata(1,:),testdata(2,:), r);
    
    y = reshape( y, size(X,1), size(X,2) );
    legend=['r =',num2str(r)];
    figure;
    
    imagesc(flipud(y));
    title(legend);
end
