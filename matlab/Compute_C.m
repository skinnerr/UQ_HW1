function [ C ] = Compute_C( Cxx, x )
%%%
% IN:
%      Cxx - covariance function of (x1, x2)
%      x   - discretized domain
% OUT:
%      C   - [C_ij] = \int_D Cxx(x1,x2) \phi_i(x1) \phi_j(x2) dx1 dx2
%%%

% Constants.
nsh1 = length(x);   % # 1d shape functions
nsh2 = length(x)^2; % # 2d shape functions
nen = 4;            % # element nodes
nel  = (nsh1-1)^2;  % # global elements

% Pre-allocate C matrix.
C = zeros(nsh1);

% Generate various mapping arrays.
[IEN, AN1D, EX] = Generate_Maps(nsh1);

% Loop over elements and local nodes, filling C.
for e = 1:nel
    x1range = EX(e,1) + [0,1];
    x2range = EX(e,2) + [0,1];
    for a = 1:nen
        A = IEN(e,a);
        tmp = Gauss2D(Cxx, x1range, x2range);
        I = AN1D(A,1);
        J = AN1D(A,2);
        C(I,J) = C(I,J) + tmp;
    end
end

end