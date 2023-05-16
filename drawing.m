function [] = drawing(L1, L2, L3, minTh1, maxTh1, minTh2, maxTh2, minTh3, maxTh3)
   %L1 = 5; L2 = 3; L3 = 2; minTh1 = 0; maxTh1 = 210; minTh2 = 0; maxTh2 = 180; minTh3 = 0; maxTh3 = 150;
   Max = L1 + L2 + L3;
axis([-1*(Max+1) (Max+1) -1*(Max+1) (Max+1)])
grid on
hold on

%---------------------------------------------------------------------------------------------------------%
    for i = 1:abs((maxTh1-minTh1))
      x1(i) = L1*cosd(i+minTh1) + L2*cosd(i+minTh1+minTh2) + L3*cosd(i+minTh1+minTh2+minTh3);
      y1(i) = L1*sind(i+minTh1) + L2*sind(i+minTh1+minTh2) + L3*sind(i+minTh1+minTh2+minTh3);
      plot(x1(i),y1(i),'.');
      %hold on
      %drawnow
    end
    
    for i = 1:abs((maxTh1-minTh1))
      x2(i) = L1*cosd(i+minTh1) + L2*cosd(i+minTh1+minTh2) + L3*cosd(i+minTh1+minTh2+maxTh3);
      y2(i) = L1*sind(i+minTh1) + L2*sind(i+minTh1+minTh2) + L3*sind(i+minTh1+minTh2+maxTh3);
      plot(x2(i),y2(i),'.');
      %hold on
      %drawnow
    end
    
    for i = 1:abs((maxTh1-minTh1))
      x3(i) = L1*cosd(i+minTh1) + L2*cosd(i+minTh1+maxTh2) + L3*cosd(i+minTh1+maxTh2+minTh3);
      y3(i) = L1*sind(i+minTh1) + L2*sind(i+minTh1+maxTh2) + L3*sind(i+minTh1+maxTh2+minTh3);
      plot(x3(i),y3(i),'.');
      %hold on
      %drawnow
    end
   
   for i = 1:abs((maxTh1-minTh1))
      x4(i) = L1*cosd(i+minTh1) + L2*cosd(i+minTh1+maxTh2) + L3*cosd(i+minTh1+maxTh2+maxTh3);
      y4(i) = L1*sind(i+minTh1) + L2*sind(i+minTh1+maxTh2) + L3*sind(i+minTh1+maxTh2+maxTh3);
      plot(x4(i),y4(i),'.');
      %hold on
      %drawnow
   end
%----------------------------------------------------------------------------------------------------------%
    for i = 1:abs((maxTh2-minTh2))
       x5(i) = L1*cosd(minTh1) + L2*cosd(minTh1+i+minTh2) + L3*cosd(minTh1+i+minTh2+minTh3);
       y5(i) = L1*sind(minTh1) + L2*sind(minTh1+i+minTh2) + L3*sind(minTh1+i+minTh2+minTh3);
       plot(x5(i),y5(i),'.');
       %hold on
       %drawnow
    end
    
    for i = 1:abs((maxTh2-minTh2))
       x6(i) = L1*cosd(minTh1) + L2*cosd(minTh1+i+minTh2) + L3*cosd(minTh1+i+minTh2+maxTh3);
       y6(i) = L1*sind(minTh1) + L2*sind(minTh1+i+minTh2) + L3*sind(minTh1+i+minTh2+maxTh3);
       plot(x6(i),y6(i),'.');
       %hold on
       %drawnow
    end
    for i = 1:abs((maxTh2-minTh2))
      x7(i) = L1*cosd(maxTh1) + L2*cosd(maxTh1+i+minTh2) + L3*cosd(maxTh1+i+minTh2+minTh3);
      y7(i) = L1*sind(maxTh1) + L2*sind(maxTh1+i+minTh2) + L3*sind(maxTh1+i+minTh2+minTh3);
      plot(x7(i),y7(i),'.');
      %hold on
      %drawnow
   end
   for i = 1:abs((maxTh2-minTh2))
      x8(i) = L1*cosd(maxTh1) + L2*cosd(maxTh1+i+minTh2) + L3*cosd(maxTh1+i+minTh2+maxTh3);
      y8(i) = L1*sind(maxTh1) + L2*sind(maxTh1+i+minTh2) + L3*sind(maxTh1+i+minTh2+maxTh3);
      plot(x8(i),y8(i),'.');
      %hold on
      %drawnow
   end
%----------------------------------------------------------------------------------------------------------%
   for i = 1:abs((maxTh3-minTh3))
      x9(i) = L1*cosd(minTh1) + L2*cosd(minTh1+minTh2) + L3*cosd(minTh1+minTh2+i+minTh3);
      y9(i) = L1*sind(minTh1) + L2*sind(minTh1+minTh2) + L3*sind(minTh1+minTh2+i+minTh3);
      plot(x9(i),y9(i),'.');
      %hold on
      %drawnow
   end
   for i = 1:abs((maxTh3-minTh3))
      x10(i) = L1*cosd(minTh1) + L2*cosd(minTh1+maxTh2) + L3*cosd(minTh1+maxTh2+i+minTh3);
      y10(i) = L1*sind(minTh1) + L2*sind(minTh1+maxTh2) + L3*sind(minTh1+maxTh2+i+minTh3);
      plot(x10(i),y10(i),'.');
      %hold on
      %drawnow
   end
   for i = 1:abs((maxTh3-minTh3))
      x11(i) = L1*cosd(maxTh1) + L2*cosd(maxTh1+minTh2) + L3*cosd(maxTh1+minTh2+i+minTh3);
      y11(i) = L1*sind(maxTh1) + L2*sind(maxTh1+minTh2) + L3*sind(maxTh1+minTh2+i+minTh3);
      plot(x11(i),y11(i),'.');
      %hold on
      %drawnow
   end
   for i = 1:abs((maxTh3-minTh3))
      x12(i) = L1*cosd(maxTh1) + L2*cosd(maxTh1+maxTh2) + L3*cosd(maxTh1+maxTh2+i+minTh3);
      y12(i) = L1*sind(maxTh1) + L2*sind(maxTh1+maxTh2) + L3*sind(maxTh1+maxTh2+i+minTh3);
      plot(x12(i),y12(i),'.');
      %hold on
      %drawnow
   end
%----------------------------------------------------------------------------------------------------------%
end