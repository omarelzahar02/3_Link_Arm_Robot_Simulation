function can = Line_Connecting(X1, Y1,phi1, X2 , Y2, phi2, L1, L2, L3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max)
%L1 = 5; L2 = 3; L3 = 2; Theta1min = 0; Theta1max = 210; Theta2min = 0; Theta2max = 180; Theta3min = 0; Theta3max = 270;
%X1 = 6; Y1 = 6;
%X2 = 2; Y2 = 8;
Max = L1 + L2 + L3;
axis([-1*(Max+1) (Max+1) -1*(Max+1) (Max+1)])
phi1 = 0;
phi2 = 0;
can = 1;
RangeX=X1-X2;
RangeY=Y1-Y2;
RangePhi = phi1-phi2;
grid on
hold on
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