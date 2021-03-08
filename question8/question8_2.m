ts = 0:0.001:0.05;
c0 = [1, 10, 0, 0];
global k1;
global k2;
global k3;
k1 = 100;
k2 = 600;
k3 = 150;
[t,c]=ode45(@rates,ts,c0);       
[t,c];

c_E = c(:, 1);
c_S = c(:, 2);
c_ES = c(:, 3);
c_P = c(:, 4);

v_ES = k1 * c_E .* c_S - k2 .* c_ES - k3 .* c_ES;
v_P = k3 * c_ES;
v_S = - k1 * c_E .* c_S + k2 * c_ES;
v_E = - k1 * c_E .* c_S + k2 * c_ES + k3 * c_ES;
[t, v_E, v_S, v_ES, v_P]

plot(ts(2:end), v_E(2:end));
hold on;
plot(ts(2:end), v_S(2:end));
plot(ts(2:end), v_ES(2:end));
plot(ts(2:end), v_P(2:end));
xlabel("Time (min)");
ylabel("Rate of Changes (\mu M/min)");
legend(["v_E", "v_S", "v_{ES}", "v_P"]);
hold off;
saveas(gcf,'8.2_velocity.png')

plot(c_S, v_P(2:end));
xlabel("Concentration of S (\mu M)");
ylabel("Velocity of P (\mu M/min)");
% saveas(gcf, '8.3_vp_cs.png')
