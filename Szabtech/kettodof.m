P = tf(2,conv([2 1],[7 1]));
w0=5/9;
ksi=0.9;
scinf= -3*w0;
soinf= -5*w0;
s1= -w0*ksi - j*w0*sqrt(1-ksi^2);
s2 = conj(s1);
Ts = (2*pi)/(w0*180);

z1=exp(s1*Ts);
z2=exp(s2*Ts);
zoinf=exp(soinf*Ts);
zcinf=exp(scinf*Ts);
D = c2d(P,Ts);
B = D.num{1};
A = D.den{1};
Bplus = 1;
Bm = B;

Am = poly([z1 z2]);
Ao = poly([zoinf zoinf]);

Bmv = sum(Am)/sum(Bm);
T = Bmv*Ao;
alfa=conv(A,[1 -1]);
gamma = conv(Am,Ao);
M = [alfa' [Bm(2:end) 0 0]' [Bm 0]' [0 Bm]'];
v = gamma(2:end)' - [alfa(2:end) 0]';
x = inv(M)*v;

R = conv([1 -1],[1 x(1)]);
S = x(2:end)';

Wtr = tf(T,R,Ts);
Wsr = tf(S,R,Ts);
Wcl = minreal(Wtr*feedback(D,Wsr,-1));
