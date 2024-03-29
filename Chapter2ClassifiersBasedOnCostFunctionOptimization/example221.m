%演示感知机
rand('seed', 0);

N = [100 100]; %Number of vectors in each class
L = 2; % Dimensionality of the input space
x = [3 3]';

X1 = [2*rand(L, N(1)) 2*rand(L, N(2))+ x*ones(1, N(2))];
X1 = [X1; ones(1, sum(N))];
y1=  [-ones(1, N(1)) ones(1, N(2))];

figure(1), plot(X1(1, y1==1), X1(2, y1==1), 'bo', X1(1, y1==-1), X1(2, y1==-1), 'r.');
figure(1), axis equal;
hold on;

%对X1执行感知机算法
rho= 0.01; %Learning rate
w_ini=[1 1 -0.5]';
[w, iter, mis_clas] = perce(X1, y1, w_ini, rho)


%figure(1), fplot(@(x) (((-w(1)) * x) /(w(2)) + w(3)));
figure(1), plotpc([w(1) w(2)], w(3));