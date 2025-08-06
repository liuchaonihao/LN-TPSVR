% Matlab implementation of the LN-TPSVR algorithm in the paper

function model = sgdtrain(traindata,parameters)

rand( 'seed' , sum(100*clock));
N = size(traindata,1);
%N=100;
model.scale = parameters.scale;
% model.miu = parameters.miu;
% M = parameters.M;
B = parameters.B;
epsilon=parameters.epsilon;

disp('bsgd training starts.')
tic
for o = 1:parameters.epoch
    index = randperm(N);   
  %index = randperm(N);   
    for i = 1:N        
   %{   
   j = index(i);   
        x = traindata(i,1:end-1);   
        y = traindata(i,end); 
   %}
     j = index(i); 
        x = traindata(j,1:end-1);
        y = traindata(j,end); 
        t = (o-1)*N + i;
        
        if t == 1 % initialization
                model.X = x;
                Y = zeros(1,1);
                Y(i,1) = y;
%             Y = zeros(M,1);
%             Y(y,1) = y;
%             Y(mod(y,M)+1,1) = -1;
                model.ALPHA = Y;
                model.b=Y;
           
        else
            
            Eta = 1/(parameters.lambda*t);  
%             Eta = 1/parameters.lambda;
            
            k = rbfkernel(model.X',x',model.scale);
            Y_pred = k'* model.ALPHA'+ model.b; 
%           y_pred = Y_pred(i);   
            y_pred = Y_pred;
%           Y_pred(i) = -Inf;
%           [max_value runnerup] = max(Y_pred); % the maximal prediction  
            model.ALPHA = (1 - Eta*parameters.lambda)*model.ALPHA;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            model.b = y-model.ALPHA*k-epsilon;
              
            if (abs(y_pred - y) > epsilon) 
                if (o==1)
                model.X = [model.X; x];
                Y = zeros(1,1);
                Y = y;
                end
%                 if y_pred - y < 0
% %                      Eta =model.p^(N-i) *Eta;   
%                     Eta = Eta;
%                 else
% %                      Eta = -model.p^(N-i) *Eta;             
%                     Eta = -Eta;
%                 end
                Eta = Eta*(y-y_pred);

                if (o == 1)
                    model.ALPHA = [model.ALPHA Y];
                end
                
                if size(model.X,1)>B  
                    
                    [p, trash] = C_findsmallest(model.ALPHA', B+1, 1, Eta); % find the SV  
                    K_p = rbfkernel(model.X',model.X(p,:)',model.scale); % calulate the kernel distance between x_p  
                    
                    % solve the optimization  
                    [q, k, k_1z, k_2z, loss, a_1, a_2] = C_computeLossV3_smallest(K_p, model.ALPHA', B+1, 1, Eta, p);
                    
                    x_1 = model.X(p,:); 
                    x_2 = model.X(q,:); 
                    z = k*x_1 + (1-k)*x_2; %  calulate the feature vector  
                    z_Alpha = model.ALPHA(:,p).*k_1z + model.ALPHA(:,q).*k_2z; % the optimal solution: calulate the alpha 
                    
                    % remove old SVs and add the SV
                    model.X([p q],:) = [];
                    model.ALPHA(:,[p q]) = [];
                    model.X = [model.X;z];
                    model.ALPHA = [model.ALPHA z_Alpha];
                end
            end
        end
    end
    disp(['bsgd epoch ' num2str(o) '(' num2str(parameters.epoch) ') done; total elapsed time is ' num2str(toc)])
end
disp('bsgd training ends.')

