function [distance] = SIR2(G, source, T)
% SIR mode lassuming that each node can be infected multiple times
    n = size(G,1);
    Q = [source];
    number_at_t = 1;
    distance = [1];
    while ~isempty(Q)
        for i = 1:number_at_t
            sQ = Q(i);
            for j = 1 : n
                if G(sQ,j)==1 && rand<=T
                    Q(end+1) = j;
                end
            end
        end
        Q = Q(number_at_t+1:end);
        number_at_t = size(Q, 2);
    end
end