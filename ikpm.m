function [Theta1, Theta2, Theta3] = ikpm(X, Y, phi, L1, L2, L3)
% X, Y are the position coordinates of the end effector
% phi is the orientation angle of the end effector
% L1, L2, L3 are link lengths
% Theta1, Theta2, Theta3 are the joint angles in radians

% Calculate the position of joint 3
x3 = X - L3*cos(phi);
y3 = Y - L3*sin(phi);

% Calculate the angle of joint 1
Theta1 = atan2(y3, x3) - acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2)));

% Calculate the position of joint 2
x2 = x3 + L2*cos(Theta1 + acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2))));
y2 = y3 + L2*sin(Theta1 + acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2))));

% Calculate the angle of joint 2
Theta2 = acos((x2^2 + y2^2 - L1^2 - L2^2) / (2*L1*L2));

% Calculate the angle of joint 3
Theta3 = phi - Theta1 - Theta2;

end
