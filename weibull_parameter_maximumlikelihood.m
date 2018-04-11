%%Maximum Likelihood method 
% for finding weibull parameter
filename = 'wind_chittagong.xlsx';
sheet = 1;
xlRange = 'A22:Y22';

F = xlsread(filename,sheet,xlRange);


F(find(F==0)) = [];

len = length(F);

syms solk 
a = 0; b=0; l=0;
for i=1:len
a= (((F(i))^solk)*(log(F(i))))+a;
b= ((F(i))^solk)+b;
l= (log(F(i)))+l;
end
x(i)=a;
y(i)=b;

d=(l/len);

h= (((a)/(b))-d);

eqn = solk == ((h)^(-1));

%parameter, k:
km = solve(eqn,solk)

bc=0;
for i=1:len

    
bc= ((F(i))^km)+bc;
l= (log(F(i)))+l;
end
% parameter, c: 
cm=((bc/len)^(1/km))



