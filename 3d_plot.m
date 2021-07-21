xt = @(t) exp(-t/8).*sin(4*t);
yt = @(t) exp(-t/8).*cos(4*t);
zt = @(t) t;
fplot3(xt,yt,zt,[-10 10])
xlabel(`nit x')
ylabel(`nit y')
zlabel(`nit z')
mytitle = ['x = e^f-t/8gcos(4t), y = e^f-t/8gsin(4t), ' ...
'z = t for -10 <= t <= 10'];
title(mytitle)