%Initialization of random number generator
randn('seed', 10);
%Definition of the parameters
S1 = [.5 0 0; 0 .5 0; 0 0 .01];
S2 = [1 0 0; 0 1 0; 0 0 .01];

a=6;
mv = [0 0 0; a 0 0; a/2 a/2 0; 0 a 0; -a/2 a/2 0;-a 0 0; -a/2 -a/2 0; 0 -a 0; a/2 -a/2 0]';
N = 100;

%Generation of the data set
X = [mvnrnd(mv(:,1), S1, N)];
mvnrnd(mv(:,1), S1, N)
for i=2:9
    X = [X; mvnrnd(mv(:,i), S2,N)];
    
end

X = X';
c=2; %No of classes

y = [ones(1,N) 2*ones(1,8*N)]; %Class label vector
figure(1), plot3(X(1,y==1), X(2, y==1), X(3, y==1), 'r.', X(1, y==2), X(2, y==2), X(3, y==2), 'b.');
figure(1), axis equal;

%Scatter matrix computation
[Sw, Sb, Sm] = scatter_mat(X, y);

%Eigendecomposition of Sw^(-1)*Sb
[V, D] = eig(inv(Sw)*Sb);

%Sorting the eigenvalues in descending order
%and rearranging accordingly the eigenvectors
s = diag(D);
[s, ind] = sort(s, 1, 'descend');
V = V(:,ind);

%Selecting in A the eigenvectors corresponding
%to non-zero eigenvalues
A = V(:, 1:c-1);

%Project the data set on the space spanned by the column vectors of A
Y = A'*X;

figure(2), plot(Y(y==1), 0, 'ro', Y(y==2), 0, 'b.');
figure(2), axis equal; %可以从图2中看出两个类的投影有重叠的地方。投影后分类效果不好，这是因为投影后子空间的维数最多是1 = 2 -1.

c=3; %No of classes

y = [ones(1,N) 2*ones(1,7*N), 3*ones(1,N)]; %Class label vector
figure(3), plot3(X(1, y==1), X(2, y==1), X(3, y==1), 'r.', X(1, y==2), X(2, y==2), X(3, y==2), 'b.', X(1, y==3), X(2, y==3), X(3, y==3), 'g.');
figure(3),axis equal;

%Scatter matrix computation
[Sw, Sb, Sm] = scatter_mat(X, y);

%Eigendecomposition of Sw^(-1)*Sb
[V, D] = eig(inv(Sw)*Sb);

%Sorting the eigenvalues in descending order
%and rearranging accordingly the eigenvectors
s = diag(D);
[s, ind] = sort(s, 1, 'descend');
V = V(:,ind);

%Selecting in A the eigenvectors corresponding
%to non-zero eigenvalues
A = V(:, 1:c-1);

%Project the data set on the space spanned by the column vectors of A
Y = A'*X;

figure(4), plot(Y(1,y==1), Y(2, y==1), 'ro', Y(1, y==2), Y(2, y==2), 'b.', Y(1, y==3), Y(2, y==3), 'gx');
figure(4), axis equal;%从图中可以看出，投影后的数据保留了很好的可分性
