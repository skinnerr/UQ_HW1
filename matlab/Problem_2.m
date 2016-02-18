function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 1;
ell = 2;
a = 1/2;
b = 4;
Nx = 6;
x = linspace(0,2*a,Nx);

[lhat, phihat] = Galerkin_Eigs(sigma, ell, b, x);

[l, phi] = Analytical_Eigs(sigma, ell, a, b, x);

[lhat / max(max(lhat)), l / max(l)]

semilogy(l/max(l),'--o')


end