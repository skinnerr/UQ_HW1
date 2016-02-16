function [] = Problem_1()

Set_Default_Plot_Properties();

N = 10000;              % Number of samples
U = rand(1,N);          % Generate U(0,1) samples
X = sin(pi*(U-0.5));    % Inversion method to get Chebyshev r.v.

% Generate CDF and pdf
[CDF,x1] = ecdf(X);
[pdf,x2] = ksdensity(X,'support',[-1,1]);

% Compute analytical CDF and pdf
CDFa = 0.5+asin(x1)/pi;
pdfa = 1./(pi*sqrt(1-x2.^2));

% Plot results
figure();
hold on;
plot(x1,CDFa,'DisplayName','true F_X(x)','Color',[0.8,0.6,0.6]);
plot(x2,pdfa,'DisplayName','true f_X(x)','Color',[0.6,0.6,1.0]);
plot(x1,CDF,'r--','DisplayName','F_X(x)');
plot(x2,pdf,'b--','DisplayName','f_X(x)');
xlabel('x');
xlim([-1,1]);
ylim([0,1]);
hleg = legend('show');
set(hleg, 'Location', 'northeastoutside');

end