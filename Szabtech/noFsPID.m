P = tf(3.4,conv([36 13 1],[1 1]));
roots([9 -117 36]);
Tc = 0.3153;
Ti = 36/(9*Tc);
Td = 8*Tc;
Ap = 1.72;
PID = Ap/Ti*tf([Ti*(Td+Tc) Ti+Tc 1],[Tc 1 0]);
bode(P*PID);
Ts = (10*pi)/(180*0.42);
D = c2d(PID,Ts)
