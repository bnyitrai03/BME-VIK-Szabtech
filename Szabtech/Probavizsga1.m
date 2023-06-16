A = [0 0 1 0; 0 0 0 1; -0.5 0.2 0 0; 0.1 -0.4 0 0];
B = [0 0 0 1]';
C = [1 0 0 0];

Mc = ctrb(A,B);
ok1 = inv(Mc);
Mo = obsv(A,C);
ok2 = inv(Mo);

w0 = 1;
ksi = 0.7;
s1 = -w0*ksi + j*w0*sqrt(1-ksi^2);
s2 = conj(s1);
scinf = -3*w0;
soinf = -5*w0;

K = acker(A,B,[s1 s2 scinf scinf]);
G = acker(A',C',[soinf soinf soinf soinf])';
allapotmegf = ss(A-G*C,[B G],eye(4,4),zeros(4,2));

N = inv([A B; C 0])*[0 0 0 0 1]';
Nx = N(1:4);
Nu = N(5);

Ah = [A B; zeros(1,5)];
Bh = [B; 0];
Ch = [C 0];
Gh = acker(Ah',Ch',[soinf soinf soinf soinf soinf])';
tb = ss(Ah-Gh*Ch,[Bh Gh],eye(5,5),zeros(5,2));