function  fea = f_TLBPCM(image)
% set parameters
params.LBPmethod = 'riu2';
params.d_multiscale = 6;
spoints{1} = [-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
spoints{2} = 2*[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
spoints{3} = [-2 -1; -1 -2; -2 1; -1 2; 1 -2; 2 -1; 1 2; 2 1];
spoints{4} = 3*[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
spoints{5} = [-3 -2; -2 -3; -3 2; -2 3; 2 -3; 3 -2; 2 3; 3 2];
spoints{6} = [-3 -1; -1 -3; -3 1; -1 3; 1 -3; 3 -1; 1 3; 3 1];
params.spoints = spoints; 
params.dTLBP = 10;
params.P = 8;
params.d_result = 660;
params.MAPPING = getmapping(params.P,params.LBPmethod);
fnum = 22;
image = double(image);
fea = [];
for i = 1:fnum
    image_h = f_filter(image,i);
% Quantized and truncated
    q = 1;
    hT = 2;%for truncated operation
    T = hT;% for TLBP
    image_hqt = f_Tq(image_h,q,hT,i);
    result = f_genTLBPcooc(image_hqt,params,T);
    fea = [fea result];
% Unquantized
    Tlbp = f_getadpiT(i); 
    result = f_genTLBPcooc(image_h,params,Tlbp);
    fea = [fea result];
end

end