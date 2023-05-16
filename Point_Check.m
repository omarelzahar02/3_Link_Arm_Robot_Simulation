
% Calculate the angle of joint 3
Theta3 = phi - Theta1 - Theta2;
if(Theta1>Theta1min||Theta1 < Theta1max || Theta2>Theta2min||Theta2 < Theta2max || Theta3>Theta3min||Theta3 < Theta3max )
    can = 0;
end
end
end