Wp = tf(2,conv([2 1],[11 1]));
ft = 60;
Ts = 0.1;
Ap = 1.86;
Ti = 11;
PI = Ap/Ti * tf([Ti 1],[1 0]);
Wo = minreal(PI*Wp);
D = c2d(PI,Ts,'zoh');
