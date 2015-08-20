% This problem demonstrates three types of classifiers usage - Naive Bayes, Min Variance Gaussian 
% Classifier and Regularized. 

% The dataset used is Iris and then splitted into test and train sets:(below is the citation for it)
% Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. 
% Irvine, CA: University of California, School of Information and Computer Science.


%%
confusionmat(te(:,5),Naive(te))

%%

confusionmat(te(:,5),MinvarBayes(te))

%%

confusionmat(te(:,5),RegBayes(te,0.5,0.6))