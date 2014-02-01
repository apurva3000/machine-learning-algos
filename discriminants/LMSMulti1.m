function [ out ] = LMSMulti1( x, Y, te )
%LMS Linear Discriminant Analysis, One vs One
%No of classifiers reqd. = 5*4/2 = 10

    out = zeros(size(te,2),1);

   for k = 1:size(te,2)
        xx = te(:,k);
       
       v = zeros(1,10);
       c =0;
       for i = 1:5
            y = Y;
            v1 = zeros(1,1);
            v2 = zeros(1,1);
            for j = i+1:5 %The nested loop for permutations
                
                lx = x(:,y(:,i)==1 | y(:,j)==1);
                ly = y(y(:,i)==1 | y(:,j)==1,:);
                w = inv(lx*lx')*lx*ly;
                
                v1 = w(:,i)'*xx;
                v2 = w(:,j)'*xx;
                
                c = c+1;
                if(v1>v2)
                    v(:,c) = i;
                else
                    v(:,c) = j;
                end
                
            end
    
       end

        out(k,:) = mode(v);

        
   end
     

end

        




