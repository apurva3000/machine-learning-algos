function [ Y,classes ] = contToBinary( y )
%Converts a continous valued output to binary for abalone data
Y = zeros(size(y),5);
classes = zeros(size(y),1);

for i = 1:size(y)
    val = y(i,:);
    if(val<7)
        Y(i,1) = 1;
        classes(i) = 1;
    elseif (val>=7 && val <=8)
        Y(i,2) = 1;
        classes(i) = 2;
    elseif (val>=9 && val <=10)
        Y(i,3) = 1;
        classes(i) = 3;
    elseif (val>=11 && val <=12)
        Y(i,4) = 1;
        classes(i) = 4;
    else
        Y(i,5) = 1;
        classes(i) = 5;
    end
end

