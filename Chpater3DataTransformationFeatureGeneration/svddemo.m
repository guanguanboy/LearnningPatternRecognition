%��ʾsvd���÷�
A = [1 0 1; -1 -2 0; 0 1 -1];
disp(A);

s = svd(A); %s���Խ���˳�򷵻صľ���A������ֵ
disp(s);

%[U,S,V] = svd(A) ִ�о��� A ������ֵ�ֽ⣬��� A = U*S*V'��
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