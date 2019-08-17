%��ʾ����һ����˹���ģ��
mu = [1 2; -3 -5]; %Means
sigma = cat(3, [2 0; 0 .5], [1 0; 0 1]); %Covariances ,cat����������ָ��ά�ȴ�������
p = ones(1,2)/2; %Mixing proportions

gm = gmdistribution(mu, sigma, p);

%display properties ofthe gmm
properties(gm);

dimension = gm.NumVariables

%Visualize the probability density function (pdf) of the GMM using pdf and the MATLAB? function fsurf.
gmPDF = @(x,y)reshape(pdf(gm,[x(:) y(:)]),size(x)); 
figure(1),fsurf(gmPDF,[-10 10]); %fsurf(f,xyinterval) ����ָ�������ͼ��Ҫ�� x �� y ʹ����ͬ�����䣬�뽫 xyinterval ָ��Ϊ [min max] ��ʽ�Ķ�Ԫ��������Ҫʹ�ò�ͬ�����䣬��ָ�� [xmin xmax ymin ymax] ��ʽ����Ԫ��������fsurf(f) ��Ĭ������ [-5 5]������ x �� y��Ϊ���� z = f(x,y) ��������ͼ��
title('Probability Density Function of GMM');

%Visualize the cumulative distribution function (cdf) of the GMM using cdf and fsurf.
gmCDF = @(x,y)reshape(cdf(gm,[x(:) y(:)]),size(x)); 
figure(2),fsurf(gmCDF,[-10 10]); %fsurf(f) ��Ĭ������ [-5 5]������ x �� y��Ϊ���� z = f(x,y) ��������ͼ��
title('Cumulative Distribution Function of GMM');