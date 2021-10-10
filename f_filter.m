function image_h = f_filter(image,forder)
%
image = double(image);
X1 = padarray(image, [1 1], 'symmetric');
X2 = padarray(image, [2 2], 'symmetric');
X3 = padarray(image, [3 3], 'symmetric');
D12 = [1 -1];
D13 = [1 -2 1];
D14 = [1 -3 3 -1];
D15 = [1 -4 6 -4 1];
F1st_1 = [0 1 0; 0 -1 0; 0 0 0];
F1st_2 = [0 0 1; 0 -1 0; 0 0 0];
F1st_3 = [0 0 0; 0 -1 1; 0 0 0];
F1st_4 = [0 0 0; 0 -1 0; 0 0 1];
F1st_5 = [0 0 0; 0 -1 0; 0 1 0];
F1st_6 = [0 0 0; 0 -1 0; 1 0 0];
F1st_7 = [0 0 0; 1 -1 0; 0 0 0];
F1st_8 = [1 0 0; 0 -1 0; 0 0 0];
F2nd_1 = [0 1 0; 0 -2 0; 0 1 0];
F2nd_2 = [0 0 1; 0 -2 0; 1 0 0];
F2nd_3 = [0 0 0; 1 -2 1; 0 0 0];
F2nd_4 = [1 0 0; 0 -2 0; 0 0 1];
F3rd_1 = [0 0 -1 0 0; 0 0 3 0 0; 0 0 -3 0 0; 0 0 1 0 0; 0 0 0 0 0];
F3rd_2 = [0 0 0 0 -1; 0 0 0 3 0; 0 0 -3 0 0; 0 1 0 0 0; 0 0 0 0 0];
F3rd_3 = [0 0 0 0 0; 0 0 0 0 0; 0 1 -3 3 -1; 0 0 0 0 0; 0 0 0 0 0];
F3rd_4 = [0 0 0 0 0; 0 1 0 0 0; 0 0 -3 0 0; 0 0 0 3 0; 0 0 0 0 -1];
F3rd_5 = [0 0 0 0 0; 0 0 1 0 0; 0 0 -3 0 0; 0 0 3 0 0; 0 0 -1 0 0];
F3rd_6 = [0 0 0 0 0; 0 0 0 1 0; 0 0 -3 0 0; 0 3 0 0 0; -1 0 0 0 0];
F3rd_7 = [0 0 0 0 0; 0 0 0 0 0; -1 3 -3 1 0; 0 0 0 0 0; 0 0 0 0 0];
F3rd_8 = [-1 0 0 0 0; 0 3 0 0 0; 0 0 -3 0 0; 0 0 0 1 0; 0 0 0 0 0];
F4th_1 = [0 0 1 0 0; 0 0 -4 0 0; 0 0 6 0 0; 0 0 -4 0 0; 0 0 1 0 0];
F4th_2 = [0 0 0 0 1; 0 0 0 -4 0; 0 0 6 0 0; 0 -4 0 0 0; 1 0 0 0 0];
F4th_3 = [0 0 0 0 0; 0 0 0 0 0; 1 -4 6 -4 1; 0 0 0 0 0; 0 0 0 0 0];
F4th_4 = [1 0 0 0 0; 0 -4 0 0 0; 0 0 6 0 0; 0 0 0 -4 0; 0 0 0 0 1];
FD33h_1 = [1 -2 1; -1 2 -1; 0 0 0];
FD33h_2 = [1 -1 0; -2 2 0; 1 -1 0];
FD33h_3 = [0 0 0; -1 2 -1; 1 -2 1];
FD33h_4 = [0 -1 1; 0 2 -2; 0 -1 1];
FD55h_1 =[1 -4 6 -4 1; -2 8 -12 8 -2; 1 -4 6 -4 1; 0 0 0 0 0; 0 0 0 0 0];
FD55h_2 =[1 -2 1 0 0; -4 8 -4 0 0; 6 -12 6 0 0; -4 8 -4 0 0; 1 -2 1 0 0];
FD55h_3 =[0 0 0 0 0; 0 0 0 0 0; 1 -4 6 -4 1; -2 8 -12 8 -2; 1 -4 6 -4 1];
FD55h_4 =[0 0 1 -2 1; 0 0 -4 8 -4; 0 0 6 -12 6; 0 0 -4 8 -4; 0 0 1 -2 1];
switch forder
    % D11 D22 D33 D44
    case 1
        F = D12'*D12;
        temp = conv2(X1,F,'same');
        image_h = temp(2:end-1,2:end-1);
    case 2
        F = D13'*D13;
        temp = conv2(X1,F,'same');
        image_h = temp(2:end-1,2:end-1); 
    case 3
        F = D14'*D14;
        temp = conv2(X2,F,'same');
        image_h = temp(3:end-2,3:end-2);
    case 4
        F = D15'*D15;
        temp = conv2(X2,F,'same');
        image_h = temp(3:end-2,3:end-2);
     % D10 D20 D30 D40 D21 D42 
    case 5
        temp = conv2(X1,F1st_3,'same');
        image_h{1} = temp(2:end-1,2:end-1);
        temp = conv2(X1,F1st_1,'same');
        image_h{2} = temp(2:end-1,2:end-1);
    case 6
        temp = conv2(X1,F2nd_3,'same');
        image_h{1} = temp(2:end-1,2:end-1);
        temp = conv2(X1,F2nd_1,'same');
        image_h{2} = temp(2:end-1,2:end-1);
    case 7 
        temp = conv2(X2,F3rd_3,'same');
        image_h{1} = temp(3:end-2,3:end-2);
        temp = conv2(X2,F3rd_1,'same');
        image_h{2} = temp(3:end-2,3:end-2);
    case 8 
        temp = conv2(X2,F4th_3,'same');
        image_h{1} = temp(3:end-2,3:end-2);
        temp = conv2(X2,F4th_1,'same');
        image_h{2} = temp(3:end-2,3:end-2);
    case 9
        temp = conv2(X1,FD33h_1,'same');
        image_h{1} = temp(2:end-1,2:end-1);
        temp = conv2(X1,FD33h_2,'same');
        image_h{2} = temp(2:end-1,2:end-1);
    case 10
        temp = conv2(X2,FD55h_1,'same');
        image_h{1} = temp(3:end-2,3:end-2);
        temp = conv2(X2,FD55h_2,'same');
        image_h{2} = temp(3:end-2,3:end-2);
    % min D10 D20 D30 D40 D21 D42 
    case 11
        temp1 = conv2(X1,F1st_1,'same');
        temp2 = conv2(X1,F1st_2,'same');
        temp3 = conv2(X1,F1st_3,'same');
        temp4 = conv2(X1,F1st_4,'same');
        temp5 = conv2(X1,F1st_5,'same');
        temp6 = conv2(X1,F1st_6,'same');
        temp7 = conv2(X1,F1st_7,'same');
        temp8 = conv2(X1,F1st_8,'same');
        temp = min(min(min(min(min(min(min(temp1,temp2),temp3),temp4),temp5),temp6),temp7),temp8);
        image_h = temp(2:end-1,2:end-1);
    case 12
        temp1 = conv2(X1,F2nd_1,'same');
        temp2 = conv2(X1,F2nd_2,'same');
        temp3 = conv2(X1,F2nd_3,'same');
        temp4 = conv2(X1,F2nd_4,'same');
        temp = min(min(min(temp1,temp2),temp3),temp4);
        image_h = temp(2:end-1,2:end-1);
    case 13
        temp1 = conv2(X2,F3rd_1,'same');
        temp2 = conv2(X2,F3rd_2,'same');
        temp3 = conv2(X2,F3rd_3,'same');
        temp4 = conv2(X2,F3rd_4,'same');
        temp5 = conv2(X2,F3rd_5,'same');
        temp6 = conv2(X2,F3rd_6,'same');
        temp7 = conv2(X2,F3rd_7,'same');
        temp8 = conv2(X2,F3rd_8,'same');
        temp = min(min(min(min(min(min(min(temp1,temp2),temp3),temp4),temp5),temp6),temp7),temp8);
        image_h = temp(3:end-2,3:end-2);
    case 14
        temp1 = conv2(X2,F4th_1,'same');
        temp2 = conv2(X2,F4th_2,'same');
        temp3 = conv2(X2,F4th_3,'same');
        temp4 = conv2(X2,F4th_4,'same');
        temp = min(min(min(temp1,temp2),temp3),temp4);
        image_h = temp(3:end-2,3:end-2);
    case 15
        temp1 = conv2(X1,FD33h_1,'same');
        temp2 = conv2(X1,FD33h_2,'same');
        temp3 = conv2(X1,FD33h_3,'same');
        temp4 = conv2(X1,FD33h_4,'same');
        temp = min(min(min(temp1,temp2),temp3),temp4);
        image_h = temp(2:end-1,2:end-1);
    case 16
        temp1 = conv2(X2,FD55h_1,'same');
        temp2 = conv2(X2,FD55h_2,'same');
        temp3 = conv2(X2,FD55h_3,'same');
        temp4 = conv2(X2,FD55h_4,'same');
        temp = min(min(min(temp1,temp2),temp3),temp4);
        image_h = temp(3:end-2,3:end-2);
    % max D10 D20 D30 D40 D21 D42 
    case 17
        temp1 = conv2(X1,F1st_1,'same');
        temp2 = conv2(X1,F1st_2,'same');
        temp3 = conv2(X1,F1st_3,'same');
        temp4 = conv2(X1,F1st_4,'same');
        temp5 = conv2(X1,F1st_5,'same');
        temp6 = conv2(X1,F1st_6,'same');
        temp7 = conv2(X1,F1st_7,'same');
        temp8 = conv2(X1,F1st_8,'same');
        temp = max(max(max(max(max(max(max(temp1,temp2),temp3),temp4),temp5),temp6),temp7),temp8);
        image_h = temp(2:end-1,2:end-1);
    case 18
        temp1 = conv2(X1,F2nd_1,'same');
        temp2 = conv2(X1,F2nd_2,'same');
        temp3 = conv2(X1,F2nd_3,'same');
        temp4 = conv2(X1,F2nd_4,'same');
        temp = max(max(max(temp1,temp2),temp3),temp4);
        image_h = temp(2:end-1,2:end-1);
    case 19
        temp1 = conv2(X2,F3rd_1,'same');
        temp2 = conv2(X2,F3rd_2,'same');
        temp3 = conv2(X2,F3rd_3,'same');
        temp4 = conv2(X2,F3rd_4,'same');
        temp5 = conv2(X2,F3rd_5,'same');
        temp6 = conv2(X2,F3rd_6,'same');
        temp7 = conv2(X2,F3rd_7,'same');
        temp8 = conv2(X2,F3rd_8,'same');
        temp = max(max(max(max(max(max(max(temp1,temp2),temp3),temp4),temp5),temp6),temp7),temp8);
        image_h = temp(3:end-2,3:end-2);
    case 20
        temp1 = conv2(X2,F4th_1,'same');
        temp2 = conv2(X2,F4th_2,'same');
        temp3 = conv2(X2,F4th_3,'same');
        temp4 = conv2(X2,F4th_4,'same');
        temp = max(max(max(temp1,temp2),temp3),temp4);
        image_h = temp(3:end-2,3:end-2);
    case 21
        temp1 = conv2(X1,FD33h_1,'same');
        temp2 = conv2(X1,FD33h_2,'same');
        temp3 = conv2(X1,FD33h_3,'same');
        temp4 = conv2(X1,FD33h_4,'same');
        temp = max(max(max(temp1,temp2),temp3),temp4);
        image_h = temp(2:end-1,2:end-1);
    case 22
        temp1 = conv2(X2,FD55h_1,'same');
        temp2 = conv2(X2,FD55h_2,'same');
        temp3 = conv2(X2,FD55h_3,'same');
        temp4 = conv2(X2,FD55h_4,'same');
        temp = max(max(max(temp1,temp2),temp3),temp4);
        image_h = temp(3:end-2,3:end-2);
    
end