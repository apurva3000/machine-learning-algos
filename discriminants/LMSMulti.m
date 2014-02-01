function [ out ] = LMSMulti( x, Y, te )
%LMS Linear Discriminant Analysis
%One-against-all rule


    out = zeros(size(te,2),1);

    
 
   for k = 1:size(te,2)
        xx = te(:,k);
       v = zeros(1,5);
        for i = 1:5
            y = Y;
    
            for j = 1:5
                if(j~=i)
                    y(:,j) = 0;
                end
            end
      
            w = inv(x*x')*x*y;
      

            v(:,i) =  (w(:,i)'*xx);
    
        end
 
    [id,class] = max(v);
    out(k) = class;
   end
    
        
    



       

end

        




