%计算高斯分布的值
m = [0 1]';
S = eye(2);
x1 = [0.2 1.3]';
x2 = [2.2 -1.3]';

pg1 = comp_gauss_dens_val(m, S, x1);
pg2 = comp_gauss_dens_val(m, S, x2);

disp(pg1);
disp(pg2);
