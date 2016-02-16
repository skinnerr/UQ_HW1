function [] = Analytical_Eigs_Test()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1;
N = 30;
x = linspace(-1,1,100);

[l, phi] = Analytical_Eigs(sigma, ell, a, N, x);

figure();
subplot(1,2,1);
semilogy(1:N,l,'-o');
xlabel('i');
ylabel('\lambda_i');
subplot(1,2,2);
plot(x,phi');
xlabel('x');
ylabel('\phi_i(x)');

end