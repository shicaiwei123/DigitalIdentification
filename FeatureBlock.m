function feature = FeatureBlock(img)
% 输入:黑底白字的二值图像。输出：35维的网格特征
% ======提取特征，转成5*7的特征矢量,把图像中每10*10的点进行划分相加，进行相加成一个点=====%
%======即统计每个小区域中图像象素所占百分比作为特征数据====%
feature = blkproc(img,[4 4],'SumColor');
feature=reshape(feature,[1,49]);