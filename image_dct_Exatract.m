
embed = imread('embed.png');

figure
imshow(embed);
%p = rgb2gray(lena);
%imshow(I);

[m,n] = size(embed);

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

v = zeros(1,4016);
k=1;
Blocks{64,64}(1,1)

for i = 1:64
    for j = 1:64
        
        E = Blocks{i,j}(1,1);
        
        v(k) = extract(E);
        k = k+1;
        
    end 
end
M = zeros(64,64);
k=1;
for i = 1:64
    for j = 1:64
      M(i,j)=v(k);
      k=k+1;
    end
end

       
        

%disp(v)
 L = mat2gray(B);
 chin= imread('chinese.jpeg');
 C= im2bw(chin);

figure

imshow(L);

figure
imshow(C);
