%%Pass the number of clusters, seeds- The training samples, and seedTe the test samples
function [ label, mea ] = myKmeans( k , seeds, seedTe )
arr = [];


p = randperm(size(seeds,2));
for m = 1:k
    arr(:,1,m) = seeds((1:7),p(m));
    seeds((1:7),p(m)) = 0;
end


for n = 1:size(seeds,2)
    res = [];
    
    %disp(mean(arr(:,1,1),2));
    
    for m = 1:k
       A= arr(:,1,m);
       A = A(:,any(A));
       %mea =  sum(arr(:,1,m),2)./sum((arr(:,1,m)~=0),2);
       res(m) = norm(seeds((1:7),n)-mean(A,2));
    end
    
    [temp, maxindex] = min(res);
    %disp(maxindex);
    ins = size(arr(:,:,maxindex),2)
    arr(:,ins+1,maxindex) = seeds((1:7),n); 
    
    %disp(arr);
end
%disp(mean(arr(:,:,1),2));
ret = iterate(arr);
[label, mea] = classif(k, ret, seedTe);

end

function ret = iterate(arr)
ret = [];
doloop = 0;
[rows,cols,pages] = size(arr);
for page = 1:pages
    for col = 1:cols
        if(arr(:,col,page)~=0)
            for mk = 1:pages
            
                A = arr(:,:,mk);
                A=A(:,any(A));
                
                edis(mk) = norm(arr(:,col,page) - mean(A,2));
               %disp(mean(A,2));
            end
            [temp, maxindex] = min(edis);
            %disp(maxindex);
            if(maxindex ~= page)
                nins = size(arr(:,:,maxindex),2);
                arr(:,nins+1,maxindex) = arr(:,col,page);
                arr(:,col,page)=0;
                doloop = 1;
                
            %    disp('Maxindex'); disp(maxindex); disp('Page');disp(page);
            end
        end
    end
end

if(doloop==0 || size(arr(:,:,1),2)>9500)
    ret = arr;
else
%      disp('Next');
%      disp(mean(arr(:,:,1),2));
%      disp(size(arr(:,:,1)));
%      disp(mean(arr(:,:,2),2));
%      disp(size(arr(:,:,2)));
%      disp(mean(arr(:,:,3),2));
%      disp(size(arr(:,:,3)));
     ret = iterate(arr)
end
end


function [label,mea] = classif(k, arr , seedTe)

label = [];
res = [];
mea = [];
for c = 1:size(seedTe,2)
   for mk = 1:k
        A = arr(:,:,mk);
        A = A(:,any(A));
        edis(mk) = norm(seedTe((1:7),c)-mean(A,2));
        mea(:,:,mk) = mean(A,2);
   end
   
   disp(edis);
   disp('---');
   
    [temp, minindex] = min(edis);
    disp(minindex);
    originalindex = seedTe(8,c);
   
    label(:,c) = minindex; 
    
end

end