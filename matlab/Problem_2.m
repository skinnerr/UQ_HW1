function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1;
b = 10;
Nx = 50;
x = linspace(0,a,Nx);

[lhat, phihat] = Galerkin_Eigs(sigma, ell, b, x);

[l, phi] = Analytical_Eigs(sigma, ell, a, b, x);

[lhat / max(max(lhat)), l / max(l)]


end