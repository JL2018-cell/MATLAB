[x,y] = meshgrid(-2.5:0.1:2.5,-2.5:0.1:2.5);
f = @(x,y) (x.^2 - y.^2).*exp(-x.^2-y.^2);
z = f(x, y);
contour(x,y,z,'ShowText','on')
title(`Contour Plot of nit (x^2 - y^2)exp(-x^2- y^2)')
xlabel(`nit x')
ylabel(`nit y')
pbaspect([1 1 1])