function [WA]=GreenTheorem(l1,l2,l3,Theta1min,Theta1max,Theta2min,Theta2max,Theta3min,Theta3max)

X=linspace(0,l1+l2+l3,600);
Y=linspace(0,l1+l2+l3,600);

WA=0;
MissingPath=false;
Theta1=linspace(Theta1min,Theta1max,100);
Theta2=Theta2min;
Theta3=Theta3min;

for i = 1:100
    [X(i), Y(i), phi] = dkpm(Theta1(i),Theta2,Theta3,l1,l2,l3);
end
if l1 < (l2+l3)
    
    Theta2 = linspace(Theta2min, Theta2max, 100);
    Theta1 = Theta1max;
    Theta3 = Theta3min;
    for i = 1:100
        [X(i+100), Y(i+100), phi] = dkpm(Theta1,Theta2(i),Theta3,l1,l2,l3);
    end
    
    Theta3 = linspace(Theta3min, Theta3max, 100);
    Theta2 = Theta2max;
    Theta1 = Theta1min;
    for i = 1:100
        [X(i+300), Y(i+300), phi] = dkpm(Theta1,Theta2,Theta3(i),l1,l2,l3);
    end
    x1 = 100;
    y1 = 100;
    for i = 1 : 100
        for j = 1: 100
            if round(X(i+100),1) == round(X(j+300),1) &&  round(Y(i+100),1) == round(Y(j+300),1)
                x1 = X(i+100);
                y1 = Y(i+100);
                break
            end
        end
    end
    if x1 ~= 100 %there will be only 5 paths
        MissingPath=true;
        Theta2 = atan2d(y1,(x1 + l1));
        Theta2 = Theta2max + Theta2;
        
        Theta3 = atan2d(y1,(l1-l2-x1));
        Theta3 = -1 * Theta3;
    end
    
    Theta2 = linspace(Theta2min, Theta2, 100);
    Theta1 = Theta1max;
    Theta3 = Theta3min;
    for i = 1:100
        [X(i+100), Y(i+100), phi] = dkpm(Theta1,Theta2(i),Theta3,l1,l2,l3);
    end
    
    Theta3 = linspace(Theta3, Theta3max, 100);
    Theta2 = Theta2max;
    Theta1 = Theta1min;
    for i = 1:100
        [X(i+300), Y(i+300), phi] = dkpm(Theta1,Theta2,Theta3(i),l1,l2,l3);
    end
    
else % l1 >= l2 + l3
    Theta2 = linspace(Theta2min, Theta2max, 100);
    Theta1 = Theta1max;
    Theta3 = Theta3min;
    for i = 1:100
        [X(i+100), Y(i+100), phi] = dkpm(Theta1,Theta2(i),Theta3,l1,l2,l3);
    end
    
    Theta1 = linspace(Theta1max, Theta1min, 100);
    Theta2 = Theta2max;
    Theta3 = Theta3min;
    for i = 1:100
        [X(i+200), Y(i+200), phi] = dkpm(Theta1(i),Theta2,Theta3,l1,l2,l3);
    end
    
    Theta3 = linspace(Theta3min, Theta3max, 100);
    Theta2 = Theta2max;
    Theta1 = Theta1min;
    for i = 1:100
        [X(i+300), Y(i+300), phi] = dkpm(Theta1,Theta2,Theta3(i),l1,l2,l3);
    end
end

Theta2 = linspace(Theta2max, Theta2min, 100);
Theta1 = Theta1min;
Theta3 = Theta3max;
for i = 1:100
    [X(i+400), Y(i+400), phi] = dkpm(Theta1,Theta2(i),Theta3,l1,l2,l3);
end


Theta3 = linspace(Theta3max, Theta3min, 100);
Theta1 = Theta1min;
Theta2 = Theta2min;
for i = 1:100
    [X(i+500), Y(i+500), phi] = dkpm(Theta1,Theta2,Theta3(i),l1,l2,l3);
end

for i=1:599
    if MissingPath
        if i<201 || i>300 %to exclude the missing path
             WA=WA+(X(i+1)+X(i))*(Y(i+1)-Y(i));
        end
    else
         WA=WA+(X(i+1)+X(i))*(Y(i+1)-Y(i));
    end
end

WA=WA*0.5;
end