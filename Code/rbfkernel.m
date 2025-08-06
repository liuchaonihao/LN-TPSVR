% A fast way to compute rbf kernel
function K = rbfkernel(X,Y,scale)

K = X'*Y;
[N,Mx] = size(X);
[N,My] = size(Y);

K = 2*K;
K = K - sum(X.^2,1)'*ones(1,My);
K = K - ones(Mx,1)*sum(Y.^2,1);
K = exp(K/(2*scale));




