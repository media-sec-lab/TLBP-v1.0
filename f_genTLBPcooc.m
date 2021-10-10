function resultcooc = f_genTLBPcooc(image,params,T)
d_multiscale = params.d_multiscale;
spoints = params.spoints;
dTLBP = params.dTLBP;
MAPPING = params.MAPPING;
d_result = params.d_result;
if ~iscell(image)
    num = 1;
else
    num = size(image,2);
end
resultcooc1 = zeros(1,d_result);
sub_result = d_result/d_multiscale;
for i = 1:d_multiscale
    % TLBP coding
    if num == 1
        result = lbp_T(image,spoints{i},T,MAPPING);
    else
        for j = 1:num
        result{j} = lbp_T(image{j},spoints{i},T,MAPPING);
        end
    end
    % co-occurrence matrix calculation and aggregation
    resultcooc1(1,(i-1)*sub_result+1:i*sub_result) = f_getcooc_merge(result,dTLBP);
end
resultcooc = resultcooc1;
end