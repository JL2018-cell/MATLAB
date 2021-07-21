function projectile()
 % projectile - Path of projectile motion
 % projectile() plots the path of a projectile with
 % and without air drag. Use the mass and drag
 % coefficient for a baseball. All quantities are
 % expressed in SI units. Here we use a tilde (~)
 % to ignore an input.

 close all; % Close any figure windows

 % Generate data for the plot
 x0 = 0;
 y0 = 0;
 v0 = input(`Projectile initial speed (m/s) = ');
 theta = input(`Angle of projection (degrees) = ');
 vx0 = v0*cosd(theta);
 vy0 = v0*sind(theta);
 z0 = [x0 vx0 y0 vy0];
 tflt = 2*vy0/9.80; % Time of flight for no air drag
 tspan = [0 ceil(tflt)]; % An array recording time from the beginning to the end of flight.
 options = odeset('Events',@events,'Refine',5);
 [~,z1] = ode45(@odefun1,tspan,z0,options); %solved ordinary differential equations (ODEs) numerically.
 [~,z2] = ode45(@odefun2,tspan,z0,options);

 % Plot the data
 plot(z1(:,1),z1(:,3),`-o',z2(:,1),z2(:,3),`-o');
 title("Trajectory of a projectile");
 xlabel("x (m)");
 ylabel("y (m)");
 legend("No air drag", "With air drag");
 ylim([0 ceil(max(z1(:,3))/10)*10]);
end

% Local function, invisible to functions from other *.m files
function dzdt = odefun1(~,z)
 % Define the first order ODEs to be solved for
 % projectile motion without air drag where z(1)=x,
 % z(2)=vx, z(3)=y, z(4)=vy.
 dzdt = zeros(4,1);
 dzdt(1) = z(2);
 dzdt(2) = 0;
 dzdt(3) = z(4);
 dzdt(4) = -9.80;
end

% Local function, invisible to functions from other *.m files
function dzdt = odefun2(~,z)
 % Define the first order ODEs to be solved for
 % projectile motion with air drag where z(1)=x,
 % z(2)=vx, z(3)=y, z(4)=vy.
 b = 0.033; % Drag coefficient for a baseball
 m = 0.14; % Mass of a baseball
 dzdt = zeros(4,1);
 dzdt(1) = z(2);
 dzdt(2) = -b*z(2)/m;
 dzdt(3) = z(4);
 dzdt(4) = -9.80 - b*z(4)/m;
end

% Local function, invisible to functions from other *.m files
function [value,isterminal,direction] = events(~,z)
 % Locate the time when height passes through zero
 % in a decreasing direction and stop integration.
 value = z(3); % Detect height y=0
 isterminal = 1; % Stop the integration
 direction = -1; % Negative direction only
end