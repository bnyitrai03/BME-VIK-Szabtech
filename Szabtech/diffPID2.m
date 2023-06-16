Ap = s(1);
Tc = s(2);
wc= s(3);
Ti = 17-Tc;
Td = (60/(17-Tc))-Tc;
PID = Ap/Ti*tf([Ti*(Td+Tc) Ti+Tc 1],conv([1 0],[Tc 1]))

T = 2*pi/180*wc;
dPID = c2d(PID,T)
D = c2d(PID*P,T)