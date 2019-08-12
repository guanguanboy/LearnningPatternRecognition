%演示pca 可能是分类效果不好

randn('seed', 0); %for reprodcibility of the results

S = [.3 1.5; 1.5 9];
[l,l] = size(S);
mv = [-8 8; 8 8]';
N = 200;

X1 = [mvnrnd(mv(:,1), S, N); mvnrnd(mv(:,2), S, N)]';
y = [ones(1,N), 2*ones(1,N)];

m=2;
[eigenval, eigenvec, explained, Y, mean_vec] = pca_fun(X1, m);

%Plot of X1
figure(1), hold on;
figure(1), plot(X1(1, y==1), X1(2, y==1), 'r.', X1(1, y==2), X1(2, y==2), 'bo');

%Computation of the projections of X1
w = eigenvec(:, 1);
t1 = w'*X1(:, y==1);
t2 = w'*X1(:, y==2);

X_proj1 = [t1;t1].* ( (w/(w'*w)) * ones(1, length(t1)));
X_proj2 = [t2;t2].* ( (w/(w'*w)) * ones(1, length(t2)));

figure(1), plot(X_proj1(1,:), X_proj1(2,:), 'k.', X_proj2(1,:), X_proj2(2,:), 'ko');
figure(1), axis equal;

%Plot of the eigenvectors
figure(1),line([0; eigenvec(1,1)], [0; eigenvec(2,1)]);
figure(1),line([0; eigenvec(1,2)], [0; eigenvec(2,2)]);


%构造数据集展示pca处理之后，数据不可分

mv2 = [-1 0; 1 0]';

X2 = [mvnrnd(mv2(:,1), S, N); mvnrnd(mv2(:,2), S, N)]';


[eigenval2, eigenvec2, explained2, Y2, mean_vec2] = pca_fun(X2, m);

%Plot of X1
figure(2), hold on;
figure(2), plot(X2(1, y==1), X2(2, y==1), 'r.', X2(1, y==2), X2(2, y==2), 'bo');

%Computation of the projections of X1
w2 = eigenvec2(:, 1);
t3 = w2'*X2(:, y==1);
t4 = w2'*X2(:, y==2);

X_proj3 = [t3;t3].* ( (w2/(w2'*w2)) * ones(1, length(t3)));
X_proj4 = [t4;t4].* ( (w2/(w2'*w2)) * ones(1, length(t4)));

figure(2), plot(X_proj3(1,:), X_proj3(2,:), 'k.', X_proj4(1,:), X_proj4(2,:), 'ko');
figure(2), axis equal;

%Plot of the eigenvectors
figure(2),line([0; eigenvec2(1,1)], [0; eigenvec2(2,1)]);
figure(2),line([0; eigenvec2(1,2)], [0; eigenvec2(2,2)]);


