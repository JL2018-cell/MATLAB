
dx=0.001;
d1=0;
d2=1;
d3=0;
E=3.55;
figure
hold on

for n=0:0.001:4
    d3=2*d2-d1+(2*dx*dx)*(2.5*sign(n*n-4)+2.5-E)*d2;
    plot(n,d3,'r.');
    d1=d2;
    d2=d3;
end
