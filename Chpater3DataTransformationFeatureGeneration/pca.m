randn('seed', 0); %For reproducubility of the results
S1 = [.3 .2; .2 1];
[l, l] = size(S1);
mv = zeros(1, l);
N = 500;
m = 2;
X1 = mvnrnd(mv, S1, N)';

[eigenval, eigenvec, explained, Y, mean_vec] = pca_fun(X1, m);
disp(explained);


figure(1), hold on;
figure(1), plot(X1(1,:), X1(2,:), 'r.');
figure(1), axis equal;
figure(1), line([0; eigenvec(1,1)], [0; eigenvec(2, 1)]);
figure(1), line([0; eigenvec(1,2)], [0; eigenvec(2, 2)]);


%pca的第二幅演示图
S2 = [.3 .2; .2 9];
[l, l] = size(S1);
mv = zeros(1, l);
N = 500;
m = 2;
X2 = mvnrnd(mv, S2, N)';

[eigenval, eigenvec, explained2, Y, mean_vec] = pca_fun(X2, m);
disp(explained2);


figure(2), hold on;
figure(2), plot(X2(1,:), X2(2,:), 'r.');
figure(2), axis equal;
figure(2), line([0; eigenvec(1,1)], [0; eigenvec(2, 1)]);
figure(2), line([0; eigenvec(1,2)], [0; eigenvec(2, 2)]);