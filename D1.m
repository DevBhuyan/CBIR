%the distance function takes input as the feature vecture of the query and
%a vector from the database and outputs the distance

function dist = D1(dbk, q)
    sum = 0;
    for m = 1:numel(dbk)
        sum = sum + abs((dbk(m)-q(m))/(1+dbk(m)+q(m)));
    end
    dist = sum;
end