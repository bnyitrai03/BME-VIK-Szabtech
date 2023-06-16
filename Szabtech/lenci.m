w0 = 1;
ksi = 0.8;
s1 = -w0*ksi + j*w0*sqrt(1-ksi^2);
scinf = -2*w0;
soinf = -4*w0;
Ts = (8*pi)/(w0*180);
P = tf(4,conv([80 18 1],[1 0]));
D = c2d(P,Ts,'zoh');
z1 = exp(s1*Ts);
z2 = conj(z1);
zcinf = exp(scinf*Ts);
zoinf = exp(soinf*Ts);

B = D.num{1};
A = D.den{1};
Bp = 1;
Bm = B;

Am = poly([z1 z2 zcinf]);
Ao = poly([zoinf zoinf]);

Bmv = sum(Am)/sum(Bm);
T = conv(Bmv,Ao);

alfa = A;
gamma = conv(Am,Ao);
M = [[alfa 0]' [0 alfa]' [Bm(2:end) 0 0]' [Bm 0]' [0 Bm]'];
v = gamma(2:end)'-[alfa(2:end) 0 0]';
x = inv(M)*v;

R = conv([1],[1 x(1) x(2)])
T
S = x(3:end)'
