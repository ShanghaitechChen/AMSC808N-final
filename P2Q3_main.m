close all
clear;clc;
n = 10000;
a = 2.2;
S_graph = zeros(100,1);
S_epide = zeros(100,1);
for i = 1:10
    [G,edges,K,p] = MakePowerLawRandomGraph(n,a);
    G = full(G);
    T = DFS(G); % return the sizes of all connected components
    S_graph(i) = max(T); % record the number of nodes in the giant component
    r = rand(n)<=0.4;
    G = G.*r;
    T = DFS(G);
    S_epide(i) = max(T);
end
average_frac_graph = sum(S_graph) / (100*n);
average_frac_epide = sum(S_epide) / (100*n);