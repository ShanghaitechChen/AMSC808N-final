X = [0.861289014650108, 0.373491544625422];
for y = 0 : 0.01 : 5
    x = -5;
    while(x*pi/2 <= y)
        X = [X; x,y];
        x = x + 0.01;
    end
end
plot(X(2:end,1), X(2:end,2), '.r')
hold on
plot(X(1,1), X(1,2), '*r')

y = 5;
x = 2*(1+y) / pi;
line = [x,y];
while(y>=0)
    y = y - 0.01;
    x = 2*(1+y) / pi;
    if x<10/pi
        break
    end
    line = [line; x,y];
end
plot(line(2:end,1), line(2:end,2), '.r')