%zero-padding function

function f = ZP(ip)
    f = [zeros(1, size(ip, 2)+2)];
    for i=1:size(ip, 1)
       f = [f;
           0, ip(i, :), 0];
    end
    f = [f;
        zeros(1, size(ip, 2)+2)];
end
