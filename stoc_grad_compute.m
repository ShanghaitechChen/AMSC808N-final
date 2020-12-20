function [ga, gb] = stoc_grad_compute(a,b)
   g = @(x) 1-cos(x);
   ga = 0;
   gb = 0;
   i = randi(6)-1;
   fv = a*i*pi/10 - b;
   if fv>0
       ga = ga + (fv - g(i*pi/10))*i*pi/10;
       gb = gb + fv - g(i*pi/10);
   end 
   gb = -1 * gb;
end