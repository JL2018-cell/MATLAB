function qho(m,n)
 % qho - Quantum states of 1D harmonic oscillator
 % qho(m,n) plots the wave functions & probability
 % densities of a 1D harmonic oscillator for the
 % quantum states with quantum number from m to n.
 % Set mass*omega/hbar = 1 for convenience.

 % Check for correct input arguments
 if ~isreal(m) || mod(m,1) ~= 0 || (m < 0)
  error("First input must be a non-negative" + " integer!!")
 end
 if nargin < 2 %returns the number of input arguments supplied for calling the function.
  n = m; % Set n = m for no input value
 elseif ~isreal(n) || mod(n,1) ~= 0 || (n < m)
  error("Second input must be an integer no" + " smaller than first input!!")
 end
 close all; % Close any figure windows
 % Generate data for the plots
 A = sqrt(2*n+1); % Amplitude for classical SHO
 xm = ceil(A+2); % xlimit for the plots
 t = mod(xm, ceil(xm/5));
 if t == 0
  xticksval = -xm:ceil(xm/5):xm;
 else
  xticksval = -xm-t:ceil(xm/5):xm+t;
 end
 x = transpose(linspace(-xm,xm,500));
 H = hermite(x,n+1); %Generate Hermite polynomials.
 y = ones(length(x),n-m+1);

 for k = m:n
  C = 1/sqrt(sqrt(pi)*2^k*factorial(k));
  y(:,k-m+1) = C*exp(-x.^2/2).*H(:,k+1);
 end
 ysqr = y.^2;

 % Generate the plots of the data
 set(gcf,`units',`points',`position',[10,10,400,450])
 s1 = "fnbf Wave functions g";
 s2 = "fnbf Probability densities g";
 s3 = "fnbf of quantum harmonic oscillator ($mnomega/nhbar = 1$)g";
 xlab str = "$x$";
 subplot(2,1,1);
 ti_str = s1+s3;
 ylab_str = "$npsi n(x)$";
 plotdata(x,y,ti_str,xlab str,ylab_str);
 xticks(xticksval);
 subplot(2,1,2);
 ti_str = s2+s3;
 ylab_str = "$|npsi n(x)|^2$";
 plotdata(x,ysqr,ti_str,xlab str,ylab_str);
 xticks(xticksval);
  % Nested function
  function plotdata(x,y,ti_str,xlab str,ylab_str)
  % Plot the data in each subplot
   for kk = 1:n-m+1
    lgd_str = sprintf("$n = %d$",kk+m-1);
    plot(x,y(:,kk),`-',`DisplayName',lgd_str)
    hold on
   end;
  grid on
  pbaspect([6 3 1])
  title(ti_str,`Interpreter',`latex')
  xlabel(xlab str,`Interpreter',`latex')
  ylabel(ylab_str,`Interpreter',`latex')
  h = legend(`show');
  set(h,`Interpreter',`latex')
 end
end