function can = Line_connecting(X1, Y1,phi1, X2 , Y2, phi2, L1, L2, L3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max)
can = 1;
RangeX=X1-X2;
RangeY=Y1-Y2;
RangePhi = phi1-phi2;
for i = 0:100 
    can=(Point_Check(X2+RangeX*i/100,Y2+RangeY*i/100, phi2+RangePhi*i/100, L1, L2, L3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max));
    if(can==0)
        break;
    end
end
if(can==1)
    for i = 0:100 
      plot(X2+RangeX*i/100,Y2+RangeY*i/100,'.');
      hold on
      drawnow
    end
end
end