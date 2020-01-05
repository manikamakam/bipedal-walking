clear;
clc;

% Contact Parameters
addpath(genpath('Libraries'));
contact_damping = 100;
contact_stiffness = 25000;
mu_k = 0.6;
mu_s = 0.8;
mu_vth = 0.1;

% Link Length
l = 25;

x_l = [-10 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5];
y_l = [-40 -40 -36.25 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40];
x_r = [0 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5 0 0 0 0 0 -5 -10 -5 0 5 10 5];  
y_r = [-40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40 -40 -40 -40 -40 -40 -40 -40 -36.5 -35 -36.5 -40 -40];

length = size(x_l);
len = length(2);

hip_l = zeros(1, len);
knee_l = zeros(1, len);
ankle_l = zeros(1, len);

hip_r = zeros(1, len);
knee_r = zeros(1, len);
ankle_r = zeros(1, len);

t1 = 0:3:(3*(len)-1);
t = 0:1:(3*len-1);

for i = 1:1:len
    rl = sqrt(x_l(i)^2 + y_l(i)^2);
    xl = abs(x_l(i));
    yl = abs(y_l(i));
    rr = sqrt(x_r(i)^2 + y_r(i)^2);
    xr = abs(x_r(i));
    yr = abs(y_r(i));
    if x_l(i) < 0
        knee_l(i) = 180 - (acosd((2*(l^2) - rl^2)/(2*(l^2))));
        hip_l(i) = - (acosd(rl/(2*l)) - atand(xl/yl));
        ankle_l(i) = - ((atand(xl/yl) + acosd(rl/(2*l))));
    else
        knee_l(i) = 180 - (acosd((2*(l^2) - rl^2)/(2*(l^2))));
        hip_l(i) = - (atand(xl/yl) + acosd(rl/(2*l)));
        ankle_l(i) = - ((90 - atand(xl/yl) + acosd(rl/(2*l))) - 90);
    end
    if x_r(i) < 0
        knee_r(i) = 180 - (acosd((2*(l^2) - rr^2)/(2*(l^2))));
        hip_r(i) = - (acosd(rr/(2*l)) - atand(xr/yr));
        ankle_r(i) = - (90 - (atand(yr/xr) - acosd(rr/(2*l))));
    else
        knee_r(i) = 180 - (acosd((2*(l^2) - rr^2)/(2*(l^2))));
        hip_r(i) = - (atand(xr/yr) + acosd(rr/(2*l)));
        ankle_r(i) = - ((90 - atand(xr/yr) + acosd(rr/(2*l))) - 90);
    end
end

knee_l_in = interp1(t1, knee_l, t, 'spline');
hip_l_in = interp1(t1, hip_l ,t ,'spline');
ankle_l_in = interp1(t1 ,ankle_l ,t ,'spline');

knee_r_in = interp1(t1, knee_r, t, 'spline');
hip_r_in = interp1(t1, hip_r ,t ,'spline');
ankle_r_in = interp1(t1 ,ankle_r ,t ,'spline');

%In matrix form
knee_l_m = [t' knee_l_in'];
hip_l_m = [t' hip_l_in'];
ankle_l_m = [t' ankle_l_in'];

knee_r_m = [t' knee_r_in'];
hip_r_m = [t' hip_r_in'];
ankle_r_m = [t' ankle_r_in'];

% Plot graphs
figure;
subplot(3,1,1);
plot(t(1, 1:140), hip_l_in(1, 1:140))
xlabel('Time') 
ylabel('Hip Angle (deg)')
title('Left leg')

subplot(3,1,2);
plot(t(1, 1:140), knee_l_in(1, 1:140))
xlabel('Time') 
ylabel('Knee Angle (deg)')

subplot(3,1,3);
plot(t(1, 1:140), ankle_l_in(1, 1:140))
xlabel('Time') 
ylabel('Ankle Angle (deg)')

figure;
subplot(3,1,1);
plot(t(1, 1:140), hip_r_in(1, 1:140))
xlabel('Time') 
ylabel('Hip Angle (deg)')
title('Right leg')

subplot(3,1,2);
plot(t(1, 1:140), knee_r_in(1, 1:140))
xlabel('Time') 
ylabel('Knee Angle (deg)')

subplot(3,1,3);
plot(t(1, 1:140), ankle_r_in(1, 1:140))
xlabel('Time') 
ylabel('Ankle Angle (deg)')