lambda = [253.5 312.5 365.0 404.7 433.9];
Vo = [2.57 1.67 1.09 0.73 0.55];
lambdareci = 1./lambda;
p = polyfit(lambdareci,Vo,1);
f = polyval(p,lambdareci);
plot(lambdareci,Vo,`ob',lambdareci,f,`-r')
title('Milikan''s Data for the photoelectric effect in lithum')
xlabel(`nit x')
ylabel(`nit y')
txt1 = ['hc = ' num2str(p(1)) ' eV.nm'];
txt2 = ['work function = ' num2str(abs(p(2))) ' eV'];
text(2.3e-3,2.8,txt1,'FontSize',12)
text(2.3e-3,2.65,txt2,'FontSize',12)
