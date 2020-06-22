% DC-Motor Control in continuous-time
% State of system: 1.angular position:¦È; 2.angular speed of the motor:(¦È)'; 3.motor current: i
% Input of system: terminal voltage: u = V; Output of system: angular speed of the motor:(¦È)'

%State-space model matrix
A = [0 1 0;0 -10 1;0 -0.2 -15];
B = [0; 0; 20];
C = [0 1 0];
D = 0;

% Froem matrix to get the transfer function
[num,den]=ss2tf(A,B,C,D);
G = tf(num,den);

% prove that the open-loop system is stable
%pzmap(G); 

%Step respond of the open loop system
t = 1:0.01:2;
figure(1);
step(G,t);

Kp = 650;      % Proportional gain 
Ki = 2;      % Integral gain
Kd = 18;    % Derivative gain
C = pid(Kp, Ki, Kd); % create a controller
% A model of the unfiltered closed-loop response:
CL_u = feedback(G*C, 1);
figure(2);
step(CL_u);