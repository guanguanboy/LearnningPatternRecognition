%演示maximum-likelihood-estimation

%consider the following distribution of means from repeated random samples of an exponential distribution:
mu = 1; % Population parameter
n = 1e3; % Sample size
ns = 1e4; % Number of samples

rng('default')  % For reproducibility
samples = exprnd(mu,n,ns); % Population samples %通过几何分布生成随机数
means = mean(samples); % Sample means

%The Central Limit Theorem says that the means will be approximately normally distributed, regardless of the distribution of the data in the samples. The mle function can be used to find the normal distribution that best fits the means:
[phat,pci] = mle(means);

numbins = 50;
histogram(means,numbins,'Normalization','pdf')
hold on
x = min(means):0.001:max(means);
y = normpdf(x,phat(1),phat(2));%phat(1) and phat(2) are the MLEs for the mean and standard deviation. pci(:,1) and pci(:,1) are the corresponding 95% confidence intervals.
%y = normpdf(x,mu) returns the pdf of the normal distribution with mean mu and the unit standard deviation, evaluated at the values in x.
plot(x,y,'r','LineWidth',2);