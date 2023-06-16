P = tf(2.5,conv([16 10 1],[11 1]));
w0 = 5/21;
ksi = 0.9;
scinf=-3*w0;
soinf=-5*w0;
s1 = -w0*ksi + j*w0*sqrt(1 - ksi^2);
Ts = (4*pi)/(180*w0);

D = c2d(P,Ts);
z1 = exp(s1*Ts);
z2 = conj(z1);
zcinf = exp(scinf*Ts);
zoinf = exp(soinf*Ts);

B = D.num{1};
A = D.den{1};
roots(B);
Bplus = 1;
Bminus = B;

Am = poly([z1 z2 zcinf]);
Ao = poly([zoinf zoinf zoinf]);

Bmv = sum(Am)/sum(Bminus);
T = Bmv * Ao

alfa = conv(A,[1 -1]);
gama = conv(Am,Ao);
M =[[alfa 0]' [0 alfa]' [Bminus(2:end) 0 0 0]' [Bminus 0 0]'...
    [0 Bminus 0]' [0 0 Bminus]'];
v = gama(2:end)' - [alfa(2:end) 0 0]';
x = inv(M)*v;

R = conv([1 -1],[1 x(1) x(2)])
S = x(3:end)

