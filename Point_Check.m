function [can]=Point_Check(X, Y, phi, L1, L2, L3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max)
x3 = X - L3*cos(phi);
y3 = Y - L3*sin(phi);
can = 1;
check1 = (x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2));
check2 = (x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2));
check3 = (x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2));
if(check1 > 1 ||check1 < -1|| check2 > 1 ||check2 < -1|| check3 > 1 ||check3 < -1)
    can = 0;
else    
% Calculate the angle of joint 1
Theta1 = atan2(y3, x3) - acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2)));

% Calculate the position of joint 2
x2 = x3 + L2*cos(Theta1 + acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2))));
y2 = y3 + L2*sin(Theta1 + acos((x3^2 + y3^2 + L1^2 - L2^2) / (2*L1*sqrt(x3^2 + y3^2))));
check4 = (x2^2 + y2^2 - L1^2 - L2^2) / (2*L1*L2);
if(check4 > 1 ||check4 < -1)
    can = 0;
else
% Calculate the angle of joint 2
Theta2 = acos((x2^2 + y2^2 - L1^2 - L2^2) / (2*L1*L2));

% Calculate the angle of joint 3
Theta3 = phi - Theta1 - Theta2;
if(Theta1>Theta1min||Theta1 < Theta1max || Theta2>Theta2min||Theta2 < Theta2max || Theta3>Theta3min||Theta3 < Theta3max )
    can = 0;
end
end
end
