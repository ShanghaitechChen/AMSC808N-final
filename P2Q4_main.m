close all
clear;clc;
n = 100;
a = 2.2;
T = 0.4;
summary = {};

[G,edges,K,p] = MakePowerLawRandomGraph(n,a);
for i = 1:100
    source = randi(100);
    distance = SIR(G, source, T);
    summary{i} = distance;
end

total_num_infected = zeros(100,1);
for i = 1:100
    distance = summary{i};
    [number_each_day, total_num_infected(i)] = Find_number_each_day(distance);
    plot(1:max(distance+1), number_each_day);
    hold on
end
xlabel('Duration / days');
ylabel('Fraction of infected nodes at each day')

function [number_each_day, total_num_infected] = Find_number_each_day(distance)
    total_num_infected = sum(distance>0);
    number_each_day = zeros(max(distance)+1);
    number_each_day(1) = 1;
    for i = 2:max(distance)+1
        number_each_day(i) = sum(distance==i-1);
    end
end