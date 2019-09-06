%linear svm demo
%matlab Ñ§Ï°×ÊÔ´£ºhttps://ww2.mathworks.cn/help/stats/support-vector-machine-classification.html
%step1,to generate the data set X1, type
randn('seed', 50);
m = [0 0; 1.2 1.2]'; %mean vectors
S = 0.2*eye(2); % covariance matrix
points_per_class=[200 200];
X1 = mvnrnd(m(:,1), S, points_per_class(1))';
X1_class2 = mvnrnd(m(:,2), S, points_per_class(2))';
X1 = [X1 X1_class2];
y1 = [ones(1, points_per_class(1)) -ones(1, points_per_class(2))];

%To plot the data set X1, type
figure(1), plot(X1(1, y1==1), X1(2, y1==1), 'r.', X1(1, y1==-1), X1(2, y1==-1), 'bo');

%generate the X2(test data set)
randn('seed', 100);

X2 = mvnrnd(m(:,1), S, points_per_class(1))';
X2_class2 = mvnrnd(m(:,2), S, points_per_class(2))';
X2 = [X2 X2_class2];
y2 = [ones(1, points_per_class(1)) -ones(1, points_per_class(2))];

%Step 2. To generate the required SVM classifier for C = 0.1, use the SMO2 function, typing
kernel='linear';
kpar1=0;
kpar2=0;
C=0.1;
tol=0.001;
steps=100000;
eps=10^(-10);
method=0;
[alpha, w0, w, evals, stp, glob] = SMO2(X1', y1', kernel, kpar1, kpar2, C, tol, steps, eps, method);

%(a) To compute the classification error on the training set, X1, type
Pe_tr = sum( (2*(w*X1 - w0>0) - 1).* y1 < 0 )/ length(y1);
    %To compute the classification error on the test set, X2,
    Pe_test = sum( (2*(w*X2 - w0>0) - 1).* y2 < 0 )/ length(y2);
    
%(b) To plot the classifier hyperplane as well as the margin lines, use the function svcplot_book by
%typing2 the following:
global figt4;
figt4 = 2;
svcplot_book(X1', y1', kernel, kpar1, kpar2, alpha, -w0);

%(c) To count the support vectors, type
sup_vec = sum(alpha>0);

%(d) To compute the margin, type
marg=2/sqrt(sum(w.^2));

