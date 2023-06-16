P = tf(6,conv([17.25 8.75 1],[13.75 1]));
Ap = 0.155;
Ti = 13.75;
PI = (Ap/Ti)*tf([Ti 1],[1 0]);
Wo = minreal(PI*P);
bode(Wo)
Ts = (6*pi)/(180*0.0618);
Dpi = c2d(PI,Ts)
