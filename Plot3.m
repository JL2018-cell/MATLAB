len = 100
A = 0.1.^(2:len)*2 %set up geometric sequence: 1st term = 0.02, common factor = 0.1
B = ones(1,len - 1) %set up vector in which entries = 1
R = [2:len] %set up vectors in which entries = index
cal_result = [1:(len - 1)] %only take the leading term
cal_result2 = [1:(len - 1)] %take up to first order term
cal_result3 = [1:(len - 1)] %take up to second order term
C = B - A %Generate vector [0.98, 0.998, 0.9998, ...]
for i=1:(len - 1)
 C(i)=C(i)^(-2.5) 
end
for i=1:(len - 1)
 cal_result(i)=abs((1/C(i)) - 1);
 cal_result2(i)=abs(((1 + 2.5*A(i))/C(i)) - 1);
 cal_result3(i)=abs(((1 + 2.5*A(i) + (35/8)*A(i)*A(i))/C(i)) - 1);
end
%x0 = 10
%y0 = 10
%width = 5500
%height = 4000
%set(gcf,'position',[x0,y0,width,height])
%set(gcf,'units','points','position',[x0,y0,width,height])
semilogy(R,cal_result)
%plot(R,cal_result)
hold on
semilogy(R,cal_result2)
%plot(R,cal_result2)
hold on
semilogy(R,cal_result3)
%plot(R,cal_result3)
title('Relative Error Versus the Number of Accurate Places')
xlabel('decimal places') 
ylabel('log(relative error)') 
legend({'only take the leading term','take up to first order term','take up to second order term'},'Location','southwest')