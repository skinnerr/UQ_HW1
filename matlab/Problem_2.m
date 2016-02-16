function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1;
N = 4;
x = linspace(-1,1,5);

[lhat, phihat] = Galerkin_Eigs(sigma, ell, a, N, x);

% [l, phi] = Analytical_Eigs(sigma, ell, a, N, x);

end