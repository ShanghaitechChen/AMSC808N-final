function [ga, gb] = grad_compute(a,b)
   g = @(x) 1-cos(x);
   ga = 0;
   gb = 0;
   for i = 0:5
       fv = a*i*pi/10 - b;
       if fv>0
           ga = ga + (fv - g(i*pi/10))*i*pi/10;
           gb = gb + fv - g(i*pi/10);
       end
   end
   ga = ga / 6;
   gb = -1 * gb / 6;        
end