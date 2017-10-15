fid_image=fopen('train-images.idx3-ubyte','r');
fid_label=fopen('train-labels.idx1-ubyte','r');
% Read the first 16 Bytes
magicnumber=fread(fid_image,4);
size=fread(fid_image,4);
row=fread(fid_image,4);
col=fread(fid_image,4);
% Read the first 8 Bytes
extra=fread(fid_label,8);
% Read labels related to images
imageIndex=fread(fid_label);
Num=length(imageIndex);
% Count repeat times of 0 to 9
cnt=zeros(1,10);
for k=1:Num
    image=fread(fid_image,[max(row),max(col)]);     % Get image data
    val=imageIndex(k);      % Get value of image
    for i=0:9
        if val==i
            cnt(val+1)=cnt(val+1)+1; %сп0
        end
    end
    if cnt(val+1)<10
        str=[num2str(val),'_000',num2str(cnt(val+1)),'.bmp'];
    elseif cnt(val+1)<100
        str=[num2str(val),'_00',num2str(cnt(val+1)),'.bmp'];
    elseif cnt(val+1)<1000
        str=[num2str(val),'_0',num2str(cnt(val+1)),'.bmp'];
    else
        str=[num2str(val),'_',num2str(cnt(val+1)),'.bmp'];
    end
    imwrite(image',str);
end
fclose(fid_image);
fclose(fid_label);