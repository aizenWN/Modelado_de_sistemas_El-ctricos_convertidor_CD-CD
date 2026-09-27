function dxdt = convertidor_de_potencia(t, x, L, C, R, Uin)

dxdt = zeros(2,1);

iL = x(1);
Vc = x(2);

f_pwm = 100e3;
T_pwm = 1/f_pwm;
duty = 0.40;

if mod(t,T_pwm) < duty*T_pwm
    d = 1;
else
    d = 0;
end

dxdt(1) = -(1/L)*Vc + (Uin/L)*d;
dxdt(2) = (1/C)*iL - (1/(R*C))*Vc;

end