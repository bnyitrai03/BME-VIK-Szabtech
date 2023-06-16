function y = kesesPID(x)
P = tf(2,[1 1 1],'iodelay',1);
Ap = x(1);
wc = x(2);
Tc = x(3);

y = [((66*Ap)/(17-Tc)/Tc)-6;...
    (3*Ap/(17-Tc)/wc/sqrt(wc^2*Tc^2+1)/sqrt(wc^2+1))-1;...
    pi/2 - atan(wc*Tc) - atan(wc)- wc - (61*pi)/180];

end