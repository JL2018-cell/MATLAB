t = linspace(0,5,500);
x = cos(2*pi*t);
v = -2*pi*sin(2*pi*t);
subplot(2,1,1)
plot(t,x)
title(`Position of a simple harmonic oscillator')
xlabel(`Time')
ylabel(`Position')
subplot(2,1,2)
plot(t,v)
title(`Speed of a simple harmonic oscillator')
xlabel(`Time')
ylabel(`Speed')