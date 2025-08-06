% normalize.m

function [meanv,stdv,datanew]=mynormalize(data,meanvv,stdvv)

a=size(data);
e=ones(a(1),1);
if length(meanvv)==0
   meanv=mean(data);
   stdv=std(data);
   q=find(stdv<0.01);
   stdv(q)=1000;
else
   meanv=meanvv;
   stdv=stdvv;
end

for i=1:a(2)
   x=data(:,i)-e*meanv(i);
   datanew(:,i)=x/stdv(i);
end

return;