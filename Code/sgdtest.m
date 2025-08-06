function  pred_y= sgdtest(testdata, model)
chunk = 1000; % chunk the testing data into smaller size and proceed the testing sequentially to prevent Matlab Out-of-Memory

X = model.X;
ALPHA = model.ALPHA;
scale = model.scale;
N = size(testdata,1);
pred_y = zeros(1,N);

for i = 1:ceil( N/chunk )
    ind_start = 1+(i-1)*chunk;
    if i*chunk<N
        ind_end = i*chunk;
    else
        ind_end = N;
    end
    
    k = rbfkernel(X',testdata(ind_start:ind_end,1:end-1)',scale);
%     Y_pred = k'*ALPHA'+model.scale * model.miu;
    Y_pred = k'*ALPHA'+model.b;
    pred_y(1,ind_start:ind_end) = Y_pred;
end
% pred_y
% err = pred_y'-testdata(:,end);
% mae = sum(abs(err))/N

