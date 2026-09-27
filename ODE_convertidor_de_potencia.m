L = 0.002;
R = 10;
C = 10e-6;
Vin = 32;

x0 = [0; 0];

tspan = [0 2e-3];

f_pwm = 100e3;
T_pwm = 1/f_pwm;

opciones = odeset('MaxStep', T_pwm/20);

[t,x] = ode45(@(t,x) convertidor_de_potencia(t,x,L,C,R,Vin), ...
    tspan, x0, opciones);

iL = x(:,1);
Vc = x(:,2);

figure;

subplot(2,1,1);
plot(t,iL);
grid on;
ylabel('i_L [A]');
title('Corriente del inductor');

subplot(2,1,2);
plot(t,Vc);
grid on;
ylabel('V_C [V]');
xlabel('Tiempo [s]');
title('Voltaje del capacitor');