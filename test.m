function [x1 y1 x2 y2 x3 y3 x4 y4] = Draw(L1, L2, L3, minTh1, maxTh1, minTh2, maxTh2, minTh3, maxTh3)
    L1 = 5; L2 = 3; L3 = 4; minTh1 = 0; maxTh1 = 210; minTh2 = 0; maxTh2 = 180; minTh3 = 0; maxTh3 = 150;
    Max = L1 + L2 + L3;
axis([-1*(Max+1) (Max+1) -1*(Max+1) (Max+1)])
grid on
hold on
x1 = linspace(0,Max,600);
y1 = linspace(0,Max,600);

     for i = 1:abs((maxTh1-minTh1))*5
       x1(i) = L1*cosd(i*0.1+minTh1) + L2*cosd(i*0.1+minTh1+minTh2) + L3*cosd(i*0.1+minTh1+minTh2+minTh3);
       y1(i) = L1*sind(i*0.1+minTh1) + L2*sind(i*0.1+minTh1+minTh2) + L3*sind(i*0.1+minTh1+minTh2+minTh3);
       plot(x1(i),y1(i),'.');
       hold on
       drawnow
     end
     for i = 1:abs((maxTh1-minTh1))*5
       x2(i) = L1*cosd(i*0.1+minTh1) + L2*cosd(i*0.1+minTh1+minTh2) + L3*cosd(i*0.1+minTh1+minTh2+maxTh3);
       y2(i) = L1*sind(i*0.1+minTh1) + L2*sind(i*0.1+minTh1+minTh2) + L3*sind(i*0.1+minTh1+minTh2+maxTh3);
       plot(x2(i),y2(i),'.');
       hold on
       drawnow
     end
     for i = 1:abs((maxTh1-minTh1))
       x3(i) = L1*cosd(i*0.1+minTh1) + L2*cosd(i*0.1+minTh1+maxTh2) + L3*cosd(i*0.1+minTh1+maxTh2+minTh3);
       y3(i) = L1*sind(i*0.1+minTh1) + L2*sind(i*0.1+minTh1+maxTh2) + L3*sind(i*0.1+minTh1+maxTh2+minTh3);
       plot(x3(i),y3(i),'.');
       hold on
       drawnow
    end
    for i = 1:abs((maxTh1-minTh1))
       x4(i) = L1*cosd(i*0.1+minTh1) + L2*cosd(i*0.1+minTh1+maxTh2) + L3*cosd(i*0.1+minTh1+maxTh2+maxTh3);
       y4(i) = L1*sind(i*0.1+minTh1) + L2*sind(i*0.1+minTh1+maxTh2) + L3*sind(i*0.1+minTh1+maxTh2+maxTh3);
       plot(x4(i),y4(i),'.');
       hold on
       drawnow
    end