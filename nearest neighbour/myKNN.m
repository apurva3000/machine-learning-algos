function [ out ] = myKNN(  traindata, trainclass, testdata ,K,L)
%KNN Algorithm - K-Nearest neighbour classification
%   Input:
% Trainingdata, Testdata, number of neighbours, the distance parameter

for m = 1:size(testdata,2)
    
    tdata = testdata(:,m);
  
    delta = [0,0];
    for n = 1:size(traindata,2)
        ldata =  traindata(:,n);
        lclass = trainclass(:,n);
        d = norm(ldata-tdata, L);
       
       delta = [delta;[d,lclass]];
     
       % disp(w);
       % disp(lclass);
        %disp('---');
    end
    delta(1,:) = [];
    delta = sortrows(delta,1);
    kfiltered = delta([1:K],:);
    res = mode(kfiltered(:,2));
   % disp(kfiltered);
   out(m) = res; 
    
end

end

