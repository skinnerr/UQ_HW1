function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 1;
ell = 2;
a = 1/2;
b = 10;
Nx = 50;

x = linspace(0,2*a,Nx);
[l_h, phi_h] = Galerkin_Eigs(sigma, ell, b, x);
max(max(phi_h))

% x = linspace(-a,a,Nx);
[l, phi] = Analytical_Eigs(sigma, ell, a, b, x);
max(max(phi))

plot(1:b, l_h)


end