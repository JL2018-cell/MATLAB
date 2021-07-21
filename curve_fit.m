x = 1:100;
y = 0.4*x + 1.5*randn(1,100);
p = polyfit(x,y,1);
f = polyval(p,x);
plot(x,y,`ob',x,f,`-r')
xlabel(`nit x')
ylabel(`nit y')