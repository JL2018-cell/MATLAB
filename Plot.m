N=400;
x=1;
d=0.01;
d2=0.01;
E=160;

figure()
hold on
for n=1:N
    x=2*x-0+(2*d.^2)*(2.5*sign(x.^2-4)+2.5-E)*x;
    d2=d2+0.01;
    plot(d2,x,'d')
    
    
end
