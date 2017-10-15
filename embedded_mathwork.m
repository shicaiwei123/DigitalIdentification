%% ����ͼƬ

clear all
imset = imageSet('digital1','recursive');
%�鿴ϸ��
% {imset.Description};
% {imset.Count};
%% ����ͼƬ������

%����ͼƬ
% montage(imset(2).ImageLocation(1:1000:end));
% figure
% for i=1:length(imset);
%     img=read(imset(1),randi(imset(1).Count));
%     FeatureVecter=FeatureBlock(img);
%     bar(FeatureVecter);ylabel('ColorBin#');xlabel('ColorBin*')
% end
%% train feature
imset = imageSet('digital1','recursive');
tic
trainFeatures = [];
trainlabels = [];

for i=1:size(imset,2)
    for j=1:10:imset(i).Count
        img=read(imset(i),j);
%         featureVecter1=TurncationTime(img);
        featureVecter2=FeatureBlock(img);
%         featureVecter3=COG(img);
%         featureVecter4=Quadruple(img);
        featureVecter=[featureVecter2];
        trainFeatures=vertcat(trainFeatures,featureVecter);
    end
    trainlabels=vertcat(trainlabels,repelem({imset(i).Description}',[fix((imset(i).Count)/10)],1));
end
toc
trainFeatures=trainFeatures([1:length(trainlabels)],:);
digitalImageData=array2table(trainFeatures);
digitalImageData.number=trainlabels;
%% 

% % test feature
% imtest = imageSet('test','recursive');
% 
% tic
% testFeatures = [];
% testlabels = [];
% 
% for i=1:size(imtest,2)
%     for j=1:10:imtest(i).Count
%         img=read(imtest(i),j);
% %         testfeatureVecter1=TurncationTime(img);
%         testfeatureVecter2=FeatureBlock(img);
% %         testfeatureVecter3=COG(img);
% %         featureVecter4=Quadruple(img);
%         testfeatureVecter=[testfeatureVecter2];
%         testFeatures=vertcat(testFeatures,testfeatureVecter);
%     end
%     testlabels=vertcat(testlabels,repelem({imtest(i).Description}',[fix((imtest(i).Count)/10)],1));
% end
% toc
% % ȡ��СͼƬ��������
% testFeatures=testFeatures([1:length(testlabels)],:);
% 
% digitalImageDataTest=array2table(testFeatures);
% digitalImageDataTest.number=testlabels;

%% �����ȡ�������Ի�õ���������������ȡ


% bag= bagOfFeatures(imset,'VocabularySize',10,'PointSelection','Detector');
% shapeFeatures = double(encode(bag,imset));
% labelsBOF=[];
% digitalImageDataBOF=array2table(shapeFeatures);
% labelsBOF=vertcat(labelsBOF,repelem({imset.Description}',[(imset.Count)],1));
% digitalImageDataBOF.number=labelsBOF;

%% Ԥ��Ա�
% prediction=predict(QuadraticSVM_2,testFeatures);
% i=1:length(testlabels);
% figure
% %��ʵֵ
% real=str2num(char(testlabels));
% stem(i,real );
% hold on
% %Ԥ��ֵ
% stem(i, str2num(char(prediction)));
%% ��дͼ�������ѵ��ͼ��Ա�
% input=imread('input.bmp');
% train=imread('3_0001.bmp');
% figure(1)
% subplot(2,1,1)
% imshow(input);
% subplot(2,1,2)
% imshow(train);

%% ��ͼƬ����
% I = imread('6_0001.bmp');
% imshow(I);
% I = double(I);
% [rows,cols] = size(I); 
% x = ones(rows,1)*[1:cols];
% y = [1:rows]'*ones(1,cols);   
% area = sum(sum(I)); 
% meanx = sum(sum(I.*x))/area; 
% meany = sum(sum(I.*y))/area;
% hold on;
% plot(meanx,meany,'r+'); %ʮ�ֱ������λ��



        
        
    
 
