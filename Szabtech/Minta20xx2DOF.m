Wp = tf(1,[1 0.1 1]);
Ts = 0.2;
ksi = 0.7;
w0 = 1;
l = 1;
soinf = -ksi*3;
s1 = -w0*ksi + j*w0*sqrt(1 - ksi^2);

D = c2d(Wp,Ts,'zoh');
B = D.num{1};
A = D.den{1};
roots(B);
Bp = 1;
Bm = B;

z1 = exp(s1*Ts);
z2 = conj(z1);
zoinf = exp(soinf*Ts);

Am = poly([z1 z2]);
Ao = poly([zoinf zoinf]);

Bmv = sum(Am)/sum(Bm);
T = conv(Bmv,Ao);

alfa = conv([1 -1],A);
gamma = conv(Am,Ao);
M = [alfa' [Bm(2:end) 0 0]' [Bm 0]' [0 Bm]'];
v = gamma(2:end)' - [alfa(2:end) 0]';
x = inv(M)*v;

R = conv([1 -1],[1 x(1)]);
T;
S = x(2:end)';