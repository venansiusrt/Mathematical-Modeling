[T1,Y1] = ode45(@(t,y) spread_dis(t, y, 0.2, 0.1, 0.009, 0.007, 0.02, 0.017, 0.025, 0.02, 0.003, 0.001, 0.003, 0.002, 0.001, 0.001, 0.001, 0.001,1,1,1,1),[0 500],[15 1 4 10 1 3]);
[T2,Y2] = ode45(@(t,y) spread_dis(t, y, 0.2, 0.1, 0.003, 0.002, 0.004, 0.002, 0.005, 0.002, 0.02, 0.02, 0.011, 0.012, 0.005, 0.002, 0.002, 0.002,1,1,1,1),[0 500],[30 2 8 20 2 6]);
[T3,Y3] = ode45(@(t,y) spread_dis(t, y, 0.2, 0.1, 0.009, 0.002, 0.02, 0.002, 0.025, 0.002, 0.003, 0.02, 0.003, 0.012, 0, 0, 0, 0.007, 1, 1, 1, 1),[0 500],[15;1;4;20;2;6]);

subplot(1,3,1);
plot(T1,Y1(:,1),T1,Y1(:,2),T1,Y1(:,3),T1,Y1(:,4),T1,Y1(:,5),T1,Y1(:,6));
legend('S1','E1','I1','S2','E2','I2');
grid on;
xlabel('Gambar 1');

subplot(1,3,2);
plot(T2,Y2(:,1),T2,Y2(:,2),T2,Y2(:,3),T2,Y2(:,4),T2,Y2(:,5),T2,Y2(:,6));
legend('S1','E1','I1','S2','E2','I2');
grid on;
xlabel('Gambar 2');

subplot(1,3,3);
plot(T3,Y3(:,1),T3,Y3(:,2),T3,Y3(:,3),T3,Y3(:,4),T3,Y3(:,5),T3,Y3(:,6));
legend('S1','E1','I1','S2','E2','I2');
grid on;
xlabel('Gambar 3')