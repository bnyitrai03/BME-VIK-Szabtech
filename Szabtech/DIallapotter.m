P = tf(3,conv([3 4 1],[7 1]));
w0 = 5/11;
ksi = 0.9;
s1 = -w0*ksi + j*w0*sqrt(1-ksi^2);
scinf = -3*w0;
soinf = -5*w0;

Ts =(4*pi)/(w0*180);
z1 = exp(s1*Ts);
z2 = conj(z1);
zoinf = exp(soinf*Ts);
zcinf = exp(scinf*Ts);

Dss = ss(c2d(P,Ts));
Fi = Dss.A;
Gamma = Dss.B;
C = Dss.C;

K = acker(Fi,Gamma,[z1 z2 zcinf]);
G = acker(Fi',Fi'*C',[zoinf zoinf zoinf])';
aktualisbecslo=ss(Fi-G*C*Fi,[Gamma-G*C*Gamma G],eye(3,3),zeros(3,2),Ts);

N = inv([Fi-eye(3,3) Gamma; C 0])*[0 0 0 1]';
Nu = N(4);
Nx = N(1:3);

Fih = [Fi Gamma; 0 0 0 1]; %1 db 1es kell a végére
Gammah = [Gamma; 0];
Ch = [C 0];
Gh = acker(Fih',Fih'*Ch',[zoinf zoinf zoinf zoinf])';
terhelesbecslo = ss(Fih-Gh*Ch*Fih,[Gammah-Ch*Gh*Gammah Gh],eye(4,4),zeros(4,2),Ts);