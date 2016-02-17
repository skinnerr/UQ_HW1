function [ C ] = Compute_C( Cxx, x )
%%%
% IN:
%      Cxx - covariance function of (x1, x2)
%      x   - discretized domain
% OUT:
%      C   - [C_ij] = \int_D Cxx(x1,x2) \phi_i(x1) \phi_j(x2) dx1 dx2
%%%

% Constants.
dx   = x(2) - x(1); % spacing between x-values (assumes uniform)
nsh1 = length(x);   % # 1d shape functions
nsh2 = length(x)^2; % # 2d shape functions
nen  = 4;           % # element nodes
nel  = (nsh1-1)^2;  % # global elements

% Pre-allocate C matrix.
C = zeros(nsh1);

% Generate various mapping arrays.
[IEN, AN1D, EX] = Generate_Maps(nsh1);

% Loop over elements and local nodes, filling C.
for e = 1:nel
    
    x1start = EX(e,1);
    x2start = EX(e,2);
    
    for a = 1:nen
        
        % Global node number and basis function index.
        A = IEN(e,a);
        I = AN1D(A,1);
        J = AN1D(A,2);
        
        [e, A, I, J]
        tx = linspace(0,1,100);
        ty = (1 - abs(I - 1 - tx/dx));
        plot(tx,ty);
        hold on;

        % Function to integrate; piecewise linear shape functions explicitly included.
        fun = @(x1,x2) Cxx(x1,x2) * (1 - abs(I - 1 - x1/dx)) ...
                                  * (1 - abs(J - 1 - x2/dx));
        
        % Perform quadrature.
        tmp = Gauss2D(fun, x1start, x2start, dx);
        
        % Augment C.
        C(I,J) = C(I,J) + tmp;
        
    end
end

end