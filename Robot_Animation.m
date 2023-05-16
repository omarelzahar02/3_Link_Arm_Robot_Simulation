function []=RobotAnimation(L1, L2, L3, minTh1, maxTh1, minTh2, maxTh2, minTh3, maxTh3)
    %L1 = 5; L2 = 2; L3 = 2; minTh1 = 0; maxTh1 = 210; minTh2 = 0; maxTh2 = 180; minTh3 = 0; maxTh3 = 150;

    Theta1 = linspace(minTh1, maxTh1, 80); 
    Theta2 = linspace(minTh2, maxTh2, 80); 
    Theta3 = linspace(minTh3, maxTh3, 80);

    % Calculate the (x,y) coordinates of the end effector for each joint angle
    [x, y, phi] = dkpm(L1, L2, L3, Theta1, Theta2, Theta3);


    for i = 1:length(Theta1)
        % Plot the robot arm at the current joint angles
        plot([0, L1*cosd(Theta1(i)), L1*cosd(Theta1(i)) + L2*cosd(Theta1(i) + Theta2(i)), x(i)], [0, L1*sind(Theta1(i)), L1*sind(Theta1(i)) + L2*sind(Theta1(i) + Theta2(i)), y(i)], '-O');
        axis equal;
        
        % Set the limits of the plot to the maximum extent of the robot arm
        xlim([-L1-L2-L3, L1+L2+L3]);
        ylim([-L1-L2-L3, L1+L2+L3]);
        
        pause(0.05);
    end
end