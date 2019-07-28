%绘制不同协方差矩阵高斯分布的500个数据
randn('seed', 0); %Initialization of the randn function
m = [0 0]';
S = [1 0;0 1];
N = 500;
X = mvnrnd(m, S, N)';

%plot the data set
figure(1), plot(X(1,:), X(2,:), '.');
figure(1), axis equal
figure(1), axis([-7 7 -7 7])


m = [0 0]';
S = [0.2 0;0 0.2];
N = 500;
X = mvnrnd(m, S, N)';

%plot the data set
figure(2), plot(X(1,:), X(2,:), '.');
figure(2), axis equal
figure(2), axis([-7 7 -7 7])


