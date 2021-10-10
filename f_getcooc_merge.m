function resultcooc = f_getcooc_merge(result,levelnum)

if iscell(result)
    num = size(result,2);
    [M,N] = size(result{1});
else
    num = 1;
    [M,N] = size(result);
end
resultcooc = [];
r = cell(4);
tempi = result;
%% get co-occurrence matrix
for i = 1:4
    glcm = zeros(levelnum,levelnum);
    for j = 1:num
         if num==1
             result = tempi;
         else
             result = tempi{j};
         end
        if i ==1
            C = result(:,1:end-1);
            R = result(:,2:end);
        elseif i ==2
            C = result(1:end-1,:);
            R = result(2:end,:);
        elseif i ==3
            C = result(2:end-1,2:end-1);
            R = result(3:end,3:end);
        else
            C = result(2:end-1,2:end-1);
            R = result(3:end,1:end-2);
        end
        for k = 0 : levelnum -1
            R2 = R(C(:)==k);
            for l = 0:levelnum -1
                f(k+1,l+1) = sum(R2(:)==l);
            end
        end
        glcm = glcm+f;
    end
    sum_glcm = sum(glcm(:));
    r{i} = glcm/sum_glcm;
end
%% merge directions
glcmhv = r{1}+r{2};
glcmdi = r{3}+r{4};
%% fold
[m,n] = size(glcmhv);
trimatrix = triu(ones(m,n),0);
glcmhv = glcmhv.*trimatrix+glcmhv'.*trimatrix;
for j = 1:levelnum
    glcmhv(j,j) = glcmhv(j,j)/2;
end
temp1 = reshape(glcmhv(trimatrix~=0),1,numel(glcmhv(trimatrix~=0)));
glcmdi = glcmdi.*trimatrix+glcmdi'.*trimatrix;
for j = 1:levelnum
    glcmdi(j,j) = glcmdi(j,j)/2;
end
temp2 = reshape(glcmdi(trimatrix~=0),1,numel(glcmdi(trimatrix~=0)));
tempresult = [temp1 temp2];
%% non-linear mapping
resultcooc = log10(tempresult+1/(M*N));
end