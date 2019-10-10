%%%%定义HCI70-100为舒适天，计算月舒适天数
clc
clear all
for i=1:6 
sheet=['point',num2str(i)];  
A=xlsread('HCI.xls',sheet);
for n=1:365
    for j=1:30
        if A(n,j)<=100 && A(n,j)>=70
            B(n,j)=1;
        elseif A(n,j)<70 && A(n,j)>=0
            B(n,j)=0;
        end
    end
end
xlswrite('com_day_num.xls',B,sheet);
end