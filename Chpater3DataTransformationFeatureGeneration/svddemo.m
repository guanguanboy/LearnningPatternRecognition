%演示svd的用法
A = [1 0 1; -1 -2 0; 0 1 -1];
disp(A);

s = svd(A); %s是以降序顺序返回的矩阵A的奇异值
disp(s);

%[U,S,V] = svd(A) 执行矩阵 A 的奇异值分解，因此 A = U*S*V'。
A = [1 2;
     3 4;
     5 6;
     7 8];
 
 [U, S, V] = svd(A);
 
 disp(U);
 disp(S);
 disp(V);
 
 Arestore = U*S*V';
 disp(Arestore);