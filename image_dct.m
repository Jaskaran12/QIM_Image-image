
%To divide images into 8*8 and 2dct is performed.

lena = imread('123.png');
lena = rgb2gray(lena);
figure
imshow(lena);
%p = rgb2gray(lena);
%imshow(I);

[m,n] = size(lena);

Blocks = cell(m/8,n/8);

counti = 0;

for i = 1:8:m-7
   counti = counti + 1;
   countj = 0;
   for j = 1:8:n-7
        countj = countj + 1;
        Blocks{counti,countj} = lena(i:i+7,j:j+7);
   end
end

%Blocks{8,8}


for i = 1:64
    for j = 1:64
        
        Blocks{i,j} = dct2(Blocks{i,j});
        
    end
    
end

%f  = idct2(Blocks{i,j})
Blocks{10,20}(1,1)

 chin= imread('chinese.jpeg');
 B = im2bw(chin);
 B(1,40)
  
 V = zeros(1,4016);
 k=1;
 for i = 1:64
     
     for j = 1:64
         
         V(k) = B(i,j);
         k = k + 1;
         
     end
 end
 
 EBlocks = cell(m/8,n/8);
 
 %for every block of image F(1,1) is choosed and then embeeding is done on
 %that particular bit.
 k=1;
 for i = 1:64
     for j = 1:64
         bit=V(k);
         
         k = k + 1;
         
         F = Blocks{i,j}(1,1);
         
         F1 = embedd(bit,F);
         
         Blocks{i,j}(1,1) = F1;
         
         EBlocks{i,j} = idct2(Blocks{i,j});
         
     end
 end
 
 
 counti = 0;
 lena_embed = zeros(512,512);

for i = 1:8:m-7
   counti = counti + 1;
   countj = 0;
   for j = 1:8:n-7
        countj = countj + 1;
        lena_embed(i:i+7,j:j+7) = abs(EBlocks{counti,countj}) ;
   end
end

 
 
 
 disp(abs(EBlocks{10,20}));
 L = mat2gray(lena_embed);
 imwrite(L,'embed.png')
 figure
 imshow(L);
 
 
 
 
 
 
 










