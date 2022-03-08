function [l] = lowerElements(m)
%Returns the elements below the main diagonal
l= zeros(size(m));
for i=2:size(m)
    for j=1:i-1
        l(i,j)=m(i,j);
    end
end
end

