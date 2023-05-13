function [x1 y1 x2 y2 x3 y3 x4 y4] = Draw(l1, l2, minTh1, maxTh1, minTh2, maxTh2)
    l1 = 5; l2 = 3; minTh1 = 0; maxTh1 = 210; minTh2 = 0; maxTh2 = 180;
     Max = l1 + l2;
axis([-1*(Max+1) (Max+1) -1*(Max+1) (Max+1)])
grid on
hold on

%{
x1 = linspace(0,Max,600);
y1 = linspace(0,Max,600);
x2 = linspace(0,Max,600);
y2 = linspace(0,Max,600);
x3 = linspace(0,Max,600);
y3 = linspace(0,Max,600);
x4 = linspace(0,Max,600);
y4 = linspace(0,Max,600);
%}
    for i = 1:abs((maxTh1-minTh1))*10
       x1(i) = l1*cosd(i*0.1+minTh1) + l2*cosd(i*0.1+minTh1+minTh2);
       y1(i) = l1*sind(i*0.1+minTh1) + l2*sind(i*0.1+minTh1+minTh2);
       plot(x1(i),y1(i),'.');
      hold on
      drawnow
    end
    for i = 1:abs((maxTh1-minTh1))*10
       x2(i) = l1*cosd(i*0.1+minTh1) + l2*cosd(i*0.1+minTh1+maxTh2);
       y2(i) = l1*sind(i*0.1+minTh1) + l2*sind(i*0.1+minTh1+maxTh2);
       plot(x2(i),y2(i),'.');
      hold on
      drawnow
    end
    for i = 1:abs((maxTh2-minTh2))*10
       x3(i) = l1*cosd(minTh1) + l2*cosd(minTh1+i*0.1+minTh2);
       y3(i) = l1*sind(minTh1) + l2*sind(minTh1+i*0.1+minTh2);
       plot(x3(i),y3(i),'.');
      hold on
      drawnow
    end
    for i = 1:abs((maxTh2-minTh2))*10
       x4(i) = l1*cosd(maxTh1) + l2*cosd(maxTh1+i*0.1+minTh2);
       y4(i) = l1*sind(maxTh1) + l2*sind(maxTh1+i*0.1+minTh2);
       plot(x4(i),y4(i),'.');
      hold on
      drawnow
    end
    end