%Simple Nearest Neighbour Classification
function [ out ] = myNN1( traindata, trainclass, testdata )
for m = 1:size(testdata,2)
    
    tdata = testdata(:,m);
    delta = 0;
    for n = 1:size(traindata,2)
        ldata =  traindata(:,n);
        lclass = trainclass(:,n);
        d = norm(ldata-tdata);
        delta = [delta ; [d,lclass]]
    end
    
    [s,i] = min(delta(:,1));
    out(m) = delta(i,2);
end
end

