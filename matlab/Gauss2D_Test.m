function [] = Gauss2D_Test()

Set_Default_Plot_Properties();

% Set up an integral that should evaluate to 0.0124.
truth = 0.0124039;
fun = @(x,y) (x*y) * cos(2*x*y) * sin(10*y);
x = linspace(0,1,200);
dx = x(2) - x(1);

z = nan(length(x));
for i = 1:length(x);
    for j = 1:length(x);
        z(i,j) = Gauss2D(fun, x(i), x(j), dx);
    end
end

figure();
surf(x,x,z);
xlabel('x1');
ylabel('x2');
zlabel('z');

answer = sum(sum(z*dx*dx));
relerr = abs((answer-truth)/truth);

fprintf('Gauss quad gives %.5f, relative error of %.2f percent\n',answer,relerr*100);


end