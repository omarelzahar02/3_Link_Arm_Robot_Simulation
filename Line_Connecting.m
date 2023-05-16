function can = Line_connecting(X1, Y1, X2 , Y2, phi, L1, L2, L3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max)
can = 1;
RangeX=X1-X2;
RangeY=Y1-Y2;

for i = 0:100 
    can=(Point_Check(X2+RangeX*i/100,Y2+RangeY*i/100,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max));
    if(can==0)
        break;
    end
end
if(can==1)
    for i = 0:100 
    ikpm(X2+RangeX*i/100,Y2+RangeY*i/100, phi, L1, L2, L3);
    end
end
end