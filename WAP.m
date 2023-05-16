function [] = WAP(L1, L2, L3, minTh1, maxTh1, minTh2, maxTh2, minTh3, maxTh3)
L1 = 3; L2 = 2; L3 = 2; minTh1 = 0; maxTh1 = 210; minTh2 = 0; maxTh2 = 180; minTh3 = 0; maxTh3 = 150;
Max = L1 + L2 + L3;

 axis([-1*(Max+1) (Max+1) -1*(Max+1) (Max+1)])
 grid on
 hold on

    for th1 = minTh1:4:maxTh1
        for th2 = minTh2:4:maxTh2
            for th3 = minTh3:5:maxTh3
                [x, y, phi] = dkpm(L1, L2, L3, th1, th2, th3);
                plot(x, y, '.');
                hold on
                %drawnow
            end
        end
    end