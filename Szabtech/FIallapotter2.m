A = [0 3; 0 -0.5];
B = [0 0.5]';
C = [1 0];

K = acker(A,B,[-2 -2]);
G = acker(A',C',[-6 -6])';
megfigyelo = ss(A-G*C,[B G],eye(2,2),zeros(2,2));

N = inv([A B; C 0]) * [0 0 1]';
Nu = N(3);
Nx = N(1:2);

Ah = [A B;0 0 0];
Bh = [B; 0];
Ch = [C 0];
Gh = acker(Ah',Ch',[-6 -6 -6])';
terhelesbecs = ss(Ah - Gh*Ch,[Bh Gh],eye(3,3),zeros(3,2))
