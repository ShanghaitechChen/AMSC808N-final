clear;clc;
a = 1;
b = 0;
ss = 0.1;
record = zeros(1000, 2);
grad_norm = zeros(1000,1);
for i = 1 : 1000
    [ga, gb] = stoc_grad_compute(a,b);
    grad_norm(i) = sqrt(ga.^2+gb.^2);
    a = a - ga * ss;
    b = b - gb * ss;
    ss = ss * 0.99;
    record(i,1) = a;
    record(i,2) = b;
end
plot(1:1000, grad_norm)
set(gca, 'YScale', 'log')
xlabel('steps')
ylabel('grad-norm')