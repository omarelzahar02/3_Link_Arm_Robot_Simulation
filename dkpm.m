function [X, Y, phi] = dkpm(Theta1, Theta2, Theta3, L1, L2, L3)
% Theta1, Theta2, Theta3 are joint angles in radians
% L1, L2, L3 are link lengths
% X, Y are the position coordinates of the end effector
% phi is the orientation angle of the end effector

% Extract the position coordinates and orientation angle of the end effector
X = L1*cosd(Theta1) + L2*cosd(Theta1+Theta2) + L2*cosd(Theta1+Theta2+Theta3);
Y = L1*sind(Theta1) + L2*sind(Theta1+Theta2) + L2*sind(Theta1+Theta2+Theta3);

phi = Theta1 + Theta2 + Theta3;

end
