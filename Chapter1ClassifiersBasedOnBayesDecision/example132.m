%演示使用贝叶斯分类器进行分类
P1 = 0.5;
P2 = 0.5;
m1 = [1 1]';
m2 = [3 3]';
S = eye(2);
x = [1.8 1.8]';

p1 = P1*comp_gauss_dens_val(m1, S, x); %comp_gauss_dens_val(m1, S, x)求得是p(x|w1)的概率
p2 = P2*comp_gauss_dens_val(m2, S, x); %comp_gauss_dens_val(m2, S, x)是p(x|w2)的概率

disp(p1);
disp(p2);