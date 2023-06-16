function y = myPIDgyakorlas(x)
Ap=x(1);
Tc=x(2);
wc=x(3);
y= [pi/2-atan(wc*Tc)-atan(2*wc)-56/180*pi;...
    2.8*Ap/(17-Tc)/wc/sqrt(Tc^2*wc^2+1)/sqrt(4*wc^2+1)-1;...
    60*Ap/Tc/(17-Tc)-9];
end