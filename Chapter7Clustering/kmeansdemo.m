%演示matlab自带的k-means算法
load fisheriris
%%matlab自带分类数据集fisheriris，来源于http://archive.ics.uci.edu/ml/ 中的risi数据，%其数据类别分为3类，setosa，versicolor，virginica.每类植物有50个样本，共150个。%每个样本有4个属性，分别为花萼长，花萼宽，花瓣长，花瓣宽。
X = meas(:,3:4); %3，4列分别表示花瓣长，花瓣宽

figure;
plot(X(:,1),X(:,2),'k*','MarkerSize',5);
title 'Fisher''s Iris Data';
xlabel 'Petal Lengths (cm)'; 
ylabel 'Petal Widths (cm)'; %petal是花瓣的意思

rng(1); % For reproducibility，使用非负整数 seed 为随机数生成器提供种子，以使 rand、randi 和 randn 生成可预测的数字序列。
[idx,C] = kmeans(X,3);


x1 = min(X(:,1)):0.01:max(X(:,1));
x2 = min(X(:,2)):0.01:max(X(:,2));
[x1G,x2G] = meshgrid(x1,x2);
XGrid = [x1G(:),x2G(:)]; % Defines a fine grid on the plot

idx2Region = kmeans(XGrid,3,'MaxIter',1,'Start',C)

figure;
gscatter(XGrid(:,1),XGrid(:,2),idx2Region,...
    [0,0.75,0.75;0.75,0,0.75;0.75,0.75,0],'..');
hold on;
plot(X(:,1),X(:,2),'k*','MarkerSize',5);
title 'Fisher''s Iris Data';
xlabel 'Petal Lengths (cm)';
ylabel 'Petal Widths (cm)'; 
legend('Region 1','Region 2','Region 3','Data','Location','SouthEast');
hold off;