function [] = Problem_3cd()

Set_Default_Plot_Properties();

sigma = 2;
ell = 0.2;
a = 1/2;
Nx = 100;
b = 16;

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
subplot(3,1,1);
plot(x,X(1:7,:));
xlabel('x');
ylabel('G(x,\omega)');

% Plot the mean.
sample_mean = mean(X);
subplot(3,1,2);
hold on;
plot(x,sample_mean,'DisplayName','Simulated');
plot(x,ones(1,Nx),'--','DisplayName','True');
xlabel('x');
ylabel('\langle G(x) \rangle');
hleg = legend('show');
set(hleg, 'Location', 'southwest');

% Plot the variance.
sample_variance = var(X);
subplot(3,1,3);
hold on;
plot(x,sample_variance,'DisplayName','Simulated');
plot(x,(sigma^2)*ones(1,Nx),'--','DisplayName','True');
xlabel('x');
ylabel('Var(G(x))');
hleg = legend('show');
set(hleg, 'Location', 'southwest');

end