%fit gmm demo
%Fit Gaussian Mixture Model to Data
%https://ww2.mathworks.cn/help/stats/fit-a-gaussian-mixture-model-to-data.html
mu1 = [1 2];
sigma1 = [2 0; 0 .5];
mu2 = [-3 -5];
sigma2 = [1 0; 0 1];
rng(1); % For reproducibility
X = [mvnrnd(mu1,sigma1,1000);
     mvnrnd(mu2,sigma2,1000)];
 
 %plot the simulated data.
figure(1), scatter(X(:,1),X(:,2),10,'.') % Scatter plot with points of size 10
title('Simulated Data');

%Fit a two-component GMM. Use the 'Options' name-value pair argument to display the final output of the fitting algorithm.
options = statset('Display','final');
gm = fitgmdist(X,2,'Options',options);

gmPDF = @(x,y)reshape(pdf(gm,[x(:) y(:)]),size(x));
hold on;
h = fcontour(gmPDF,[-8 6]);
title('Simulated Data and Contour lines of pdf'); 
