[A,B,C,D] = tf2ss(2,conv([40 14 1],[1 1]));
Mo = obsv(A,C);
ok = inv(Mo);
Mc = ctrb(A,B);
ok2 = inv(Mc);

ksi = 0.7;
w0 = 1;
scinf = -3*w0*ksi;
s1 = -w0*ksi + j*w0*sqrt(1-ksi^2);
s2 = conj(s1);
soinf = -5*w0*ksi;

K = acker(A,B,[s1 s2 scinf]);
G = acker(A',C',[soinf soinf soinf])';
allapotmegf = ss(A-G*C,[B G],eye(3,3),zeros(3,2));

N = inv([A B; C 0])*[0 0 0 1]'; % n hossznyi 0 kell
Nx = N(1:3); % n hosszig tart
Nu = N(end);

%terhelésbecslő
Ah = [A B;0 0 0 0];
Bh = [B;0];
Ch = [C 0];
Gh = acker(Ah',Ch',[soinf soinf soinf soinf])'; %terhelésbcs +1 dim
terhelesbecs = ss(Ah-Gh*Ch,[Bh Gh],eye(4,4),zeros(4,2));
