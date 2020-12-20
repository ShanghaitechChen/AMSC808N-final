function S_compute()
    close all
    fsz = 16;
    % power law degree distribution p_k = k^(-a)/zeta(a)
    a = 2.2;
    G0 = @(x)polylog(a,x)/polylog(a,1);
    G1 = @(x)polylog(a-1,x)./(x*polylog(a-1,1));
    x=linspace(0,1,100);
    %
    figure(1);
    hold on;
    grid;
    plot(x,G0(x),'Linewidth',2)
    plot(x,G1(x),'Linewidth',2)
    legend('G_0(x)','G_1(x)');
    xlabel('x','Fontsize',fsz);
    set(gca,'Fontsize',fsz)
    %
    % critical transissibility = 0, hence, there is always an epidemic
    nt = 101;
    t = linspace(0,1,nt); % transimissibility
    u = zeros(nt,1);
    S = zeros(nt,1);
    for i = 1 : nt
    T = t(i);
    u(i) = fzero(@(x)G1(1-T+T*x)-x,0.3);
    S(i) = 1 - G0(1-T+T*u(i));
    end
    figure(2);
    hold on;
    grid;
    plot(t,u,'Linewidth',2)
    plot(t,S,'Linewidth',2)
    legend('u','S');
    xlabel('T','Fontsize',fsz);
    set(gca,'Fontsize',fsz)
end