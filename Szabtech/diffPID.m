function y = diffPID(x)
Ap = x(1);
wc = x(2);
Tc = x(3);

y = [(Ap*66/(Tc*(17-Tc)))-9;...
    (pi/2)-atan(wc*Tc)-atan(2*wc)-56*pi/180;...
    (Ap*2.8/(17-Tc)/wc/sqrt(wc^2*Tc^2+1)/sqrt(4*wc^2+1))-1];
end