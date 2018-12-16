function dy = spread_dis(t,y,A1,A2,d1S,d2S,d1E,d2E,d1I,d2I,eps1,eps2,gam1,gam2,beta11,beta12,beta21,beta22,p1,p2,q1,q2) 
    dy = zeros(6,1);
    dy(1) = A1 - d1S*y(1) - beta11*(y(3)^p1)*(y(1)^q1) - beta12*(y(6)^p2)*(y(1)^q1);
    dy(2) = beta11*(y(3)^p1)*y(1)^q1 + beta12*(y(6)^p2)*y(1)^q1 - (d1E+eps1)*y(2);
    dy(3) = eps1*y(2) - (d1I+gam1)*y(3);
    
    dy(4) = A2 - d2S*y(4) - beta21*(y(3)^p1)*(y(4)^q2)- beta22*(y(6)^p2)*(y(4)^q2);
    dy(5) = beta21*(y(3)^p1)*(y(4)^q2) + beta22*(y(6)^p2)*(y(4)^q2) - (d2E+eps2)*y(5);
    dy(6) = eps2*y(5) - (d2I+gam2)*y(6);
end