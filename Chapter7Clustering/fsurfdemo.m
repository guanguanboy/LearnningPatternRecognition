%演示fsurf的使用
%fsurf(f) 在默认区间 [-5 5]（对于 x 和 y）为函数 z = f(x,y) 创建曲面图。
figure(1),fsurf(@(x,y)sin(x) + cos(y));


%绘制分段表达式
%指定绘图区间为 fsurf 的第二个输入参数。在相同坐标区的不同区间绘制多个曲面时，坐标轴范围会调整以包括所有数据。
f1 = @(x,y) erf(x)+cos(y);
figure(2), fsurf(f1,[-5 0 -5 5])
hold on
f2 = @(x,y) sin(x)+cos(y);
fsurf(f2,[0 5 -5 5])
hold off