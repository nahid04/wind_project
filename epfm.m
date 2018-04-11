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

cubeavgV=0;
for i=1:len
cubeavgV= ((F(i))^3)+cubeavgV;
end

tcubeavgV=((cubeavgV)/len);

Epf= ((tcubeavgV)/((tavgV)^(3)));

kepf= (1+((3.69/(Epf)^2)))

gam2= gamma((1+1/kepf));
cepf=(tavgV/gam2)

