%演示创建一个高斯混合模型
mu = [1 2; -3 -5]; %Means
sigma = cat(3, [2 0; 0 .5], [1 0; 0 1]); %Covariances ,cat的作用是沿指定维度串联数组
p = ones(1,2)/2; %Mixing proportions

gm = gmdistribution(mu, sigma, p);

%display properties ofthe gmm
properties(gm);

dimension = gm.NumVariables

%Visualize the probability density function (pdf) of the GMM using pdf and the MATLAB? function fsurf.
gmPDF = @(x,y)reshape(pdf(gm,[x(:) y(:)]),size(x)); 
figure(1),fsurf(gmPDF,[-10 10]); %fsurf(f,xyinterval) 将在指定区间绘图。要对 x 和 y 使用相同的区间，请将 xyinterval 指定为 [min max] 形式的二元素向量。要使用不同的区间，请指定 [xmin xmax ymin ymax] 形式的四元素向量。fsurf(f) 在默认区间 [-5 5]（对于 x 和 y）为函数 z = f(x,y) 创建曲面图。
title('Probability Density Function of GMM');

%Visualize the cumulative distribution function (cdf) of the GMM using cdf and fsurf.
gmCDF = @(x,y)reshape(cdf(gm,[x(:) y(:)]),size(x)); 
figure(2),fsurf(gmCDF,[-10 10]); %fsurf(f) 在默认区间 [-5 5]（对于 x 和 y）为函数 z = f(x,y) 创建曲面图。
title('Cumulative Distribution Function of GMM');