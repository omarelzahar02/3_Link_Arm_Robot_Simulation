function can=Point_Check(X, Y, Phi, l1, l2, l3,Th1min, Th1max, Th2min, Th2max,Th3min, Th3max)
Th1=0;Th2=0;Th3=0;Th11=0;Th22=0;Th33=0;
firstSol = false; %to check if the first solution is valid 
secondSol = false; %to check if the second solution is valid
twoSol = false; %is true if both solutions are valid
can = true; %to check if a valid solution within range exists
Xbar=X-l3*cosd(Phi);
Ybar=Y-l3*sind(Phi);
c2=(Xbar^2+Ybar^2-l1^2-l2^2)/(2*l1*l2);
if c2 > 1 || c2 < -1
    can=false;
    return;
end
Th2=acos(c2)*(180/pi);
if Th2>=Th2min && Th2<=Th2max
    firstSol=true;
end
Th22=-1*Th2;
if Th22>=Th2min && Th22<=Th2max
    secondSol=true;
end
if firstSol
    c1=(l1*Xbar+l2*Ybar*sind(Th2)+l2*Xbar*cosd(Th2))/(Xbar^2+Ybar^2);
    s1=(l1*Ybar+l2*Ybar*cosd(Th2)-l2*Xbar*sind(Th2))/(Xbar^2+Ybar^2);
    if c1<-1 ||c1>1 || s1<-1 || s1>1
        firstSol=false;
    else
        Th1=atan(s1/c1)*(180/pi);
        if Th1<Th1min||Th1>Th1max
            firstSol=false;
        end
    end
end
if secondSol
    c1=(l1*Xbar+l2*Ybar*sind(Th2)+l2*Xbar*cosd(Th2))/(Xbar^2+Ybar^2);
    s1=(l1*Ybar+l2*Ybar*cosd(Th2)-l2*Xbar*sind(Th2))/(Xbar^2+Ybar^2);
    if c1<-1 ||c1>1 || s1<-1 || s1>1
        secondSol=false;
    else
        Th11=atan(s1/c1)*(180/pi);
        if Th11<Th1min||Th11>Th1max
            secondSol=false;
        end
    end
end
if firstSol
   Th3=Phi-Th1-Th2;
   if(Th3<0)
   Th3 = Th3+360;
   end
   if Th3<Th3min||Th3>Th3max
       firstSol=false;
   end
end
if secondSol
   Th33=Phi-Th1-Th2;
   if Th33<Th3min||Th33>Th3max
       secondSol=false;
   end
end
twoSol=firstSol&&secondSol;
can=firstSol||secondSol;
if ~twoSol && can
    if secondSol
        Th1=Th11;
        Th2=Th22;
        Th3=Th33;
    end
end
end