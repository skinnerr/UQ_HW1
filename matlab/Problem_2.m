function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1/2;
b = 50;
Nx = 100;

x = linspace(-a,a,Nx);
[l, phi] = Analytical_Eigs(sigma, ell, a, b, x);
phi = phi * max(l);
l = l / max(l);

x = linspace(0,2*a,Nx);
[lh, phih] = Galerkin_Eigs(sigma, ell, b, x);
phih = phih * max(lh);
lh = lh / max(lh);

figure();

subplot(4,1,1);
hold on;
plot(1:b, l,  'o', 'DisplayName', 'Analytical');
plot(1:b, lh, 'x', 'DisplayName', 'Galerkin');
set(gca, 'YScale', 'log');
legend('show');

subplot(4,1,2);
hold on;
plot(1:b, abs(l-lh)./l, '+');
ylabel('Rel Err');
set(gca, 'YScale', 'log');

subplot(4,1,3);
plot(x, phi);

subplot(4,1,4);
plot(x, phih);

end