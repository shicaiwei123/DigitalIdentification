function y=Quadruple(img)
feature = blkproc(img,[14 14],'SumColor');
feature=reshape(feature,[1,4]);
y=[feature,feature];