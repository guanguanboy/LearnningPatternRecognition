%演示如何通过LDA对Example322中X2的数据降维，同时能保持可分性

randn('seed', 0); %for reprodcibility of the results

S = [.3 1.5; 1.5 9];
[l,l] = size(S);
N = 200;

mv2 = [-1 0; 1 0]';

X2 = [mvnrnd(mv2(:,1), S, N); mvnrnd(mv2(:,2), S, N)]';
y = [ones(1,N), 2*ones(1,N)];

X2_yequal1 = X2(:, y2==1);
X2_yequal2 = X2(:, y2==2);

mv_est(:,1) = mean(X2_yequal1')';
mv_est(:,2) = mean(X2_yequal2')';

[Sw, Sb, Sm] = scatter_mat(X2, y2);

w = inv(Sw)*(mv_est(:,1) - mv_est(:,2));

%Plot of the data set
figure(1), 
figure(1), hold on;
figure(1), plot(X2(1, y==1), X2(2, y==1), 'r.', X2(1, y==2), X2(2, y==2), 'bo');
figure(1), axis equal;

%Computation of the projections
t3 = w'*X2(:, y==1);
t4 = w'*X2(:, y==2);

X_proj3 = [t3;t3].* ( (w/(w'*w)) * ones(1, length(t3)));
X_proj4 = [t4;t4].* ( (w/(w'*w)) * ones(1, length(t4)));

figure(1), plot(X_proj3(1,:), X_proj3(2,:), 'y.', X_proj4(1,:), X_proj4(2,:), 'co');
figure(1), axis equal;



