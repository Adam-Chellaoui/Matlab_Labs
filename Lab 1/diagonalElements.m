function [u] = diagonalElements(m)
% Returns a matrix filled only with the elements of the main diagonal and
% zeros
u=zeros(size(m));
for n=1:size(m)
    u(n,n) = m(n,n);
end

end

