function [valid, twoSol, q1,q2,q3,q1bar,q2bar,q3bar] = IKPM_3link(X, Y, Phi, l1, l2, l3,q1min, q1max, q2min, q2max,q3min, q3max)
q1=0;q2=0;q3=0;q1bar=0;q2bar=0;q3bar=0;
firstSol = false; %to check if the first solution is valid 
secondSol = false; %to check if the second solution is valid
twoSol = false; %is true if both solutions are valid
valid = true; %to check if a valid solution within range exists
Xbar=X-l3*cosd(Phi);
Ybar=Y-l3*sind(Phi);
c2=(Xbar^2+Ybar^2-l1^2-l2^2)/(2*l1*l2);
if c2 > 1 || c2 < -1
    valid=false;
    return;
end
q2=acos(c2)*(180/pi);
if q2>=q2min && q2<=q2max
    firstSol=true;
end
q2bar=-1*q2;
if q2bar>=q2min && q2bar<=q2max
    secondSol=true;
end
if firstSol
    c1=(l1*Xbar+l2*Ybar*sind(q2)+l2*Xbar*cosd(q2))/(Xbar^2+Ybar^2);
    s1=(l1*Ybar+l2*Ybar*cosd(q2)-l2*Xbar*sind(q2))/(Xbar^2+Ybar^2);
    if c1<-1 ||c1>1 || s1<-1 || s1>1
        firstSol=false;
    else
        q1=atan(s1/c1)*(180/pi);
        if q1<q1min||q1>q1max
            firstSol=false;
        end
    end
end
if secondSol
    c1=(l1*Xbar+l2*Ybar*sind(q2)+l2*Xbar*cosd(q2))/(Xbar^2+Ybar^2);
    s1=(l1*Ybar+l2*Ybar*cosd(q2)-l2*Xbar*sind(q2))/(Xbar^2+Ybar^2);
    if c1<-1 ||c1>1 || s1<-1 || s1>1
        secondSol=false;
    else
        q1bar=atan(s1/c1)*(180/pi);
        if q1bar<q1min||q1bar>q1max
            secondSol=false;
        end
    end
end
if firstSol
   q3=Phi-q1-q2;
   if q3<q3min||q3>q3max
       firstSol=false;
   end
end
if secondSol
   q3bar=Phi-q1-q2;
   if q3bar<q3min||q3bar>q3max
       secondSol=false;
   end
end
twoSol=firstSol&&secondSol;
valid=firstSol||secondSol;
if ~twoSol && valid
    if secondSol
        q1=q1bar;
        q2=q2bar;
        q3=q3bar;
    end
end
end
