%��ʾfsurf��ʹ��
%fsurf(f) ��Ĭ������ [-5 5]������ x �� y��Ϊ���� z = f(x,y) ��������ͼ��
figure(1),fsurf(@(x,y)sin(x) + cos(y));


%���Ʒֶα��ʽ
%ָ����ͼ����Ϊ fsurf �ĵڶ����������������ͬ�������Ĳ�ͬ������ƶ������ʱ�������᷶Χ������԰����������ݡ�
f1 = @(x,y) erf(x)+cos(y);
figure(2), fsurf(f1,[-5 0 -5 5])
hold on
f2 = @(x,y) sin(x)+cos(y);
fsurf(f2,[0 5 -5 5])
hold off