f=imread('BadHist.jpg');
max1 = max(f(:));       
min2 = min(f(:)); 
f=double(f)./256.0;
figure;imshow(f);title('BasHist After before noise');
[x,y]=size(f);
I=randn(x,y);
N=(imnoise(I,'gaussian',0.2,10));
NoisyImage=f+N;
figure;imshow(NoisyImage);title('BasHist After adding noise');
sum1=0;
immean1=mean(mean(NoisyImage));
for i=1:x
    for j=1:y
        sum1=sum1+(NoisyImage(i,j)-immean1).^2;
    end
end
variance1=sum1/(x*y);
disp(variance1);

maxpix = max(NoisyImage(:));       
minpix = min(NoisyImage(:));                                 
a = 255/(maxpix - minpix);
b = (NoisyImage - minpix);
ImageAfterStretching = (a * b); 
ImageAfterStretching=double(ImageAfterStretching)/256;
figure;histogram(NoisyImage);title('Histogram Before Streching');
figure;histogram(ImageAfterStretching);title('Histogram After Streching');
figure;imshow(ImageAfterStretching);title('Image After Streching');

sum1=0;
immean1=mean(mean(ImageAfterStretching));
for i=1:x
    for j=1:y
        sum1=sum1+(ImageAfterStretching(i,j)-immean1).^2;
    end
end
variance1=sum1/(x*y);
disp(variance1);