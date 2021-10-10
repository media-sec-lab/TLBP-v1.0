function T = f_getadpiT(filternum)
switch filternum
    case 1
        F = 2;
    case 2
        F = 8;
    case 3
        F = 24;
    case 4
        F = 96;  
        
    case 5
        F = 1;
    case 6
        F = 2;
    case 7
        F = 4;
    case 8
        F = 9;
    case 9
        F = 4;
    case 10
        F = 27;    
    
    case 11
        F = 1;
    case 12
        F = 2;
    case 13
        F = 4;
    case 14
        F = 9;
    case 15
        F = 4;
    case 16
        F = 27;  
    case 17
        F = 1;
    case 18
        F = 2;
    case 19
        F = 4;
    case 20
        F = 9;
    case 21
        F = 4;
    case 22
        F = 27;  
end
T = F;
end