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
nen  = 4;           % # element nodes
nel  = (nsh1-1)^2;  % # global elements

% Pre-allocate C matrix.
C = zeros(nsh1);

% Generate various mapping arrays.
[IEN, AN1D, EX] = Generate_Maps(nsh1);

% Loop over elements and local nodes, assembling element-wise contributions to C.
for e = 1:nel
    
    x1_start = x(EX(e,1));
    x2_start = x(EX(e,2));
    
    for a = 1:nen
        
        % Global node number and basis function index.
        A = IEN(e,a);
        I = AN1D(A,1);
        J = AN1D(A,2);

        % Function to integrate; piecewise linear shape functions explicitly included.
        fun = @(x1,x2) Cxx(x1,x2) * (1 - abs(I - 1 - x1/dx)) ...
                                  * (1 - abs(J - 1 - x2/dx));
%         fun = @(x1,x2) (1 - abs(J - 1 - x2/dx));
        
%         [A I J x1_start x2_start dx]
%         tmpx = linspace(x1_start,x1_start+dx,51);
%         tmpy = linspace(x2_start,x2_start+dx,51);
%         f = nan(length(tmpx));
%         for i = 1:length(tmpx)
%             for j = 1:length(tmpy)
%                 f(i,j) = fun(tmpx(i),tmpy(j));
%             end
%         end
%         surf(tmpx, tmpy, f);
%         zlim([0,1]);
        
        % Perform quadrature.
        tmp = Gauss2D(fun, x1_start, x2_start, dx);
        
        % Augment C.
        C(I,J) = C(I,J) + tmp;
        
    end
end

end