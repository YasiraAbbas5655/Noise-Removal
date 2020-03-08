%P3.1

f=imread('cameraman.tif');
f=double(f)/256;
NoisyImage1=f + sqrt(0.2)*randn(256,256) + 0.0;
sum1=0;
immean1=mean(mean(NoisyImage1));
figure;imshow(NoisyImage1);title('first image');
for i=1:256
    for j=1:256
        sum1=sum1+(NoisyImage1(i,j)-immean1).^2;
    end
end
variance1=sum1/(256*256);
disp(variance1);


NoisyImage2=f + sqrt(0.2)*randn(256,256) + 0.0;
sum2=0;
immean2=mean(mean(NoisyImage2));
figure;imshow(NoisyImage2);title('second image');
for i=1:256
    for j=1:256
        sum2=sum2+(NoisyImage2(i,j)-immean2).^2;
    end
end
variance2=sum2/(256*256);
disp(variance2);


sum3=0;
NoisyImage3=(NoisyImage1+NoisyImage2)/2;
figure;imshow(NoisyImage3);title('After averaging image');
for i=1:256
    for j=1:256
        sum3=sum3+(NoisyImage3(i,j)-immean2).^2;
    end
end
variance3=sum3/(256*256);
disp(variance3);


%P3.3

[x,y]=size(NoisyImage1);
%NoisyImage1 = uint8(255 * mat2gray(NoisyImage1));
NoisyImage1=round(NoisyImage1);
x1=zeros(1,8);
for i=2:x-1
    for j=2:y-1
        %x1(1)=NoisyImage1(i,j);
        x1(2)=NoisyImage1(i-1,j);
        x1(3)=NoisyImage1(i+1,j);
        x1(4)=NoisyImage1(i,j-1);
        x1(5)=NoisyImage1(i,j+1);
        x1(6)=NoisyImage1(i-1,j+1);
        x1(7)=NoisyImage1(i+1,j+1);
        x1(8)=NoisyImage1(i-1,j-1);
        x1(8)=NoisyImage1(i+1,j-1);
        x1=sort(x1);
        NoisyImage1(i,j)=(x1(5)+x1(4))/2;
    end
end
figure;imshow(NoisyImage1);title('Image after median filter')