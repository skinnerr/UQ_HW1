function [ l, phix ] = Galerkin_Eigs( sigma, ell, a, N, x )
%%%
% IN:
%      sigma - standard deviation of correlation function
%      ell   - correlation length parameter
%      a     - support of eigenproblem is [-a,a]
%      N     - # of eigenpairs to compute
%      x     - points to calculate eigenfunctions
% OUT:
%      l     - eigenvalues
%      phix  - eigenfunctions evaluated over x
%%%

% Pre-allocate variables.
l     = nan(N,1);
phix  = nan(N,length(x));

% Define covariance function.
Cxx = @(x1,x2) sigma^2 * exp(-abs(x1 - x2) / ell);

%%%%%%%%%%%%%%%%%%%%
% Compute matrices %
%%%%%%%%%%%%%%%%%%%%

C = Compute_C(Cxx, x)

M = Compute_M(x);

return

%%%%%%%%%%%%%%%%%%%%%%%
% Compute eigensystem %
%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:N
    % TODO TODO TODO
    l(i) = nan;
    phi(i) = nan(size(x));
end

end