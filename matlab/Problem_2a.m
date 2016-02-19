function [] = Problem_2a()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1/2;
b = 1000;
Nx = 10;

x = linspace(-a,a,Nx);
[l, ~] = Analytical_Eigs(sigma, ell, a, b, x);

% Calculate sums of eigenvalues.
s = nan(b,1);
for i = 1:b
    s(i) = sum(l(i:end));
end
s = s / s(1);

% Plot sums of eigenvalues.
figure();
hold on;
plot(1:b, s, '-o', 'DisplayName', 'Analytical Sum');
plot(1:b, 0.1*ones(1,b),  '--','DisplayName', '10% MSE');
xlabel('b');
ylabel(['\Sigma_{i=1}^b \lambda_i / \Sigma_{i=1}^{',sprintf('%i',b),'} \lambda_i']);
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
legend('show');

% Plot eigenvalues.
figure();
hold on;
plot(1:b, l, '-o', 'DisplayName', 'Analytical');
xlabel('i');
ylabel('\lambda_i');
xlim([1,b]);
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
legend('show');

end