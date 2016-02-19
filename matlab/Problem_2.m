function [] = Problem_2()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1/2;
b = 5;
Nx = 50;

x = linspace(-a,a,Nx);
[l, phi] = Analytical_Eigs(sigma, ell, a, b, x);

x = linspace(0,2*a,Nx);
[lh, phih] = Galerkin_Eigs(sigma, ell, b, x);

% Flip Galerkin eigenfunctions to match sign of analytical ones.
phih = phih .* -repmat(sign(phih(1,:)) .* -sign(phi(1,:)), size(phih,1), 1);

% Plot.
figure();
hold on;
plot(1:b, l,  '-o', 'DisplayName', 'Analytical');
plot(1:b, lh, '--x', 'DisplayName', 'Galerkin');
xlabel('i');
ylabel('\lambda_i');
set(gca, 'YScale', 'log');
legend('show');

figure(2);
plot(1:b, abs(l-lh)./l, '-o', 'DisplayName', sprintf('N = %i', Nx));
xlabel('i');
ylabel('\lambda_i Relative Error');
set(gca, 'YScale', 'log');

figure();
hold on;
plot(x, phi);
plot(x, phih, '--k');
xlabel('x');
ylabel('\phi_i(x)');

end