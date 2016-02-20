function [] = Problem_2cd()

Set_Default_Plot_Properties();

sigma = 2;
ell = 2;
a = 1/2;
Nx = 100;
b = 3;

realizations = 100000;

x = linspace(0,2*a,Nx);
[lh, phih] = Galerkin_Eigs(sigma, ell, b, x);

X = ones(realizations,Nx); % Initialize to one because <G(x)> = 1.0;
for r = 1:realizations
    Y = randn(1,b);
    for i = 1:b
        X(r,:) = X(r,:) + sqrt(lh(i)) * phih(:,i)' * Y(i);
    end
end

% Plot a few of the realizations.
figure();
plot(x,X(1:3,:));
xlabel('x');
ylabel('G(x,\omega)');

% Plot the mean.
sample_mean = mean(X);
figure();
hold on;
plot(x,sample_mean,'DisplayName','Simulated');
plot(x,ones(1,Nx),'--','DisplayName','True');
xlabel('x');
ylabel('\langle G(x) \rangle');
legend('show');

% Plot the variance.
sample_variance = var(X);
figure();
hold on;
plot(x,sample_variance,'DisplayName','Simulated');
plot(x,(sigma^2)*ones(1,Nx),'--','DisplayName','True');
xlabel('x');
ylabel('Var(G(x))');
legend('show');

end