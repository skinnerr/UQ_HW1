function [] = Problem_3b()

Set_Default_Plot_Properties();

sigma = 2;
ell = 0.2;
a = 1/2;
Nx_all = [5,10,20,40,60,80,100,120];

for Nx = Nx_all
    
    b = Nx - 2;
    
    fprintf('Working on Nx = %i\n', Nx);

    x = linspace(-a,a,Nx);
    [l, phi] = Analytical_Eigs(sigma, ell, a, b, x);

    x = linspace(0,2*a,Nx);
    [lh, phih] = Galerkin_Eigs(sigma, ell, b, x);

    % Flip Galerkin eigenfunctions to match sign of analytical ones.
    phih = phih .* -repmat(sign(phih(1,:)) .* -sign(phi(1,:)), size(phih,1), 1);

%     figure(1);
%     hold on;
%     plot(1:b, l,  '-', 'DisplayName', sprintf('Analytical, N = %i', Nx));
%     plot(1:b, lh, 'o', 'DisplayName', sprintf('Galerkin, N = %i', Nx));
%     xlabel('i');
%     ylabel('\lambda_i');
%     xlim([1,b]);
%     set(gca, 'YScale', 'log');
%     legend('show');

    figure(2);
    hold on;
    plot(1:b, abs(l-lh)./l, '-o', 'DisplayName', sprintf('N = %i', Nx));
    xlabel('i');
    ylabel('Relative Error (|\lambda_i - \lambda_i^h| / \lambda_i)');
    xlim([1,b]);
    set(gca, 'XScale', 'log');
    set(gca, 'YScale', 'log');

%     figure(3);
%     hold on;
%     plot(x, phi);
%     plot(x, phih, '--k');
%     xlabel('x');
%     ylabel('\phi_i(x)');
    
end

figure(2);
hleg = legend('show');
set(hleg, 'Location', 'southeast');

end