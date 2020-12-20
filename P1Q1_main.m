clear;clc;
g = @(x) 1-cos(x);
l=0;u=5;
A = zeros(2);
b = zeros(2,1);
for i = l:u
    A(1,1) = A(1,1) + i*pi/10;
    A(2,2) = -1 * A(1,1);
    A(2,1) = A(2,1) + (i*pi/10).^2;
    A(1,2) = A(1,2) - 1;
    b(1) = b(1) + g(i*pi/10);
    b(2) = b(2) + i*pi/10 * g(i*pi/10);
end
X = linsolve(A,b);