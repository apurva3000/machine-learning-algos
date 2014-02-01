%% Load the abalone data (citation below) and divide it into train and test set
%Dataset citation
%Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.
load abalone.data
train = abalone(1:3133,:);
test = abalone(3133:4177,:);

%% Convert the continous target variable into discrete factors for classification
Y = contToBinary(train(:,8));
[c,testy] = contToBinary(test(:,8));

%% Multiclass with Fisher
y = FisherMulti(train(:,1:7),Y, test(:,1:7));

%% Multiclass Classification LMS One-against-All

y1 = LMSMulti(train(:,1:7)',Y,test(:,1:7)');

c1= confusionmat(testy,y1)
(sum(diag(c1))/1045)*100 %Accuracy

y2 = LMSMulti1(train(:,1:7)',Y,test(:,1:7)');
c2= confusionmat(testy,y2)
(sum(diag(c2))/1045)*100 %Accuracy


%% Logistic Regression
y = Logistic(train(:,1:7),Y,test(:,1:7))
%%
figure;
plot(c(:,1),'b.');
hold on;
plot(y(:,1),'g.');
title('Class 1');
figure;
plot(c(:,2),'b.');
hold on;
plot(y(:,2),'g.');
title('Class 2');
figure;
plot(c(:,3),'b.');
hold on;
plot(y(:,3),'g.');
title('Class 3');
figure;
plot(c(:,4),'b.');
hold on;
plot(y(:,4),'g.');
title('Class 4');
figure;
plot(c(:,5),'b.');
hold on;
plot(y(:,5),'g.');
title('Class 5');





