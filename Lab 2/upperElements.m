function [u] = upperElements(m)
%Returns the elements above the main diagonal
u = zeros(size(m));
for i=1:size(m)-1
    for j=i+1:size(m)
        u(i,j)=m(i,j);
    end
end
end

