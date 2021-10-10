function Y = f_Tq(X,q,T,filterorder)
% Quantized and truncated
switch filterorder
    case 1
        c = 1;
    case 2
        c = 4;
    case 3
        c = 9;
    case 4
        c = 36;  
        
    case 5
        c = 1;
    case 6
        c = 2;
    case 7
        c = 3;
    case 8
        c = 6;
    case 9
        c = 2;
    case 10
        c = 12;
        
    case 11
        c = 1;
    case 12
        c = 2;
    case 13
        c = 3;
    case 14
        c = 6;
    case 15
        c = 2;
    case 16
        c = 12;
    case 17
        c = 1;
    case 18
        c = 2;
    case 19
        c = 3;
    case 20
        c = 6;
    case 21
        c = 2;
    case 22
        c = 12;
end

if iscell(X)
    num = size(X,2);
else
    num = 1;
end

if num ==1
    q = q*c;
    temp = round(X/q);
    Z = temp;
    Z(Z > T)  =  T;
    Z(Z < -T) = -T;
    Y = Z;
else
    for i = 1:num
        q = q*c;
        temp = round(X{i}/q);
        Z = temp;
        Z(Z > T)  =  T;
        Z(Z < -T) = -T;
        Y{i} = Z;
    end
end

end
