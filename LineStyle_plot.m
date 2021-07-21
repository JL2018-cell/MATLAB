x = linspace(0,4*pi,200);
scatter(x,cos(x))
xlim([0 4*pi])
xticks(0:pi:4*pi)
title(`Scatter Plot of nit f(x) = cos(x)')
xlabel(`nit x')
ylabel(`nit f(x)')
box on
grid on
pbaspect([2 1 1])