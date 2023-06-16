[A1,B1,C1,D1] = tf2ss(2,conv([2 -1 -1],[0.5 1]));
Mo = obsv(A,C);
ok = inv(Mo);
Mc = ctrb(A,B);
ok2 = inv(Mc);
K = acker(A,B,[-1 -1 -1]); % -1 -1 -1 meg lesz adva 
G = acker(A',C',[-4 -4 -4])'; % itt is a -4
megfigyelo = ss(A-G*C,[B G],eye(3,3),zeros(3,2));