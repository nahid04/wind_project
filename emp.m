filename = 'wind_chittagong.xlsx';
sheet = 1;
xlRange = 'A22:Y22';

F = xlsread(filename,sheet,xlRange);
F(find(F==0)) = [];

len = length(F);
avgV=0;
for i=1:len 
avgV= (F(i))+ avgV;
end
tavgV= (avgV/len);


sigma=0;

for i=1:len 
sigma= ((F(i)-tavgV)^2)+ sigma;
end

tsigma= (((sigma)/(len-1))^(0.5));

ke= ((tsigma/tavgV)^(-1.086))


gam1= gamma((1+1/ke));
ce=(tavgV/gam1)