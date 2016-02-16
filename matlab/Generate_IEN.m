function [ IEN ] = Generate_IEN( nx )
%%%
% IN:
%      nx  - length of the x vector, assumes 2D space indexed by identical vectors
% OUT:
%      IEN - array that maps element e and local node a to global node A: IEN(e,a) = A
%%%

% Number of local nodes.
nnodel = 4;

% Number of global elements.
nel = (nx-1)^2;

% Initialize IEN array, assume quadrilateral elements.
IEN = nan(nel, nnodel);

%%%%%%%%%%%%%%%%
% Fill in IEN. %
%%%%%%%%%%%%%%%%

e = 1:nel;

for a = 1:2
    IEN(:,a) = e + (a-1) + floor( (e-1) / (nx-1) );
end

for a = 3:4
    IEN(:,a) = e + floor( (e-1) / (nx-1) ) + (nx+1) - (a-3);
end

end

