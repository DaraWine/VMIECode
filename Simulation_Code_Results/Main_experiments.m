%% insert-way_1
clc;clear all
M = imread("Original_Images\house.bmp");
Q = imread("Original_Images\Jet.tif");
B = Bit_part(M);

[LL, LH, HL, HH] = dwt2(Q,'haar'); 

LL = Insert(LL,B(:,:,1));

LH = Insert(LH,B(:,:,2));

HL = Insert(HL,B(:,:,3));

HH = Insert(HH,B(:,:,4));


I_re = idwt2(LL, LH, HL, HH,'haar'); 

imshow(uint8(I_re));

psnr(uint8(I_re),Q)

%% 提取
[LL_1, LH_1, HL_1, HH_1] = dwt2(I_re,'haar'); 
[m,n] = size(LL_1);
B_r = zeros(m,n,4);

B_r(:,:,1) = round(mod(LL_1,10));

B_r(:,:,2) = round(mod(LH_1,10));

B_r(:,:,3) = round(mod(HL_1,10));

B_r(:,:,4) = round(mod(HH_1,10));

M_r = zeros(m,n);

for i = 1:4
    M_r = M_r + B_r(:,:,i) * 4^(i-1);
end

M_r = uint8(M_r);

imshow(M_r);

sum(sum(sum(B_r~=B)))


%% insert-way_2
clc;clear all
M = imread("Original_Images\house.bmp");
Q = imread("Original_Images\Jet.tif");
B = Bit_part(M);

[m,n] = size(M);

Q_s = Q;
Q_s(1:m,1:n) = Insert(Q_s(1:m,1:n),B(:,:,1));
Q_s(1:m,n+1:2*n) = Insert(Q_s(1:m,n+1:2*n),B(:,:,2));
Q_s(m+1:2*m,1:n) = Insert(Q_s(m+1:2*m,1:n),B(:,:,3));
Q_s(m+1:2*m,n+1:2*n) = Insert(Q_s(m+1:2*m,n+1:2*n) ,B(:,:,4));

imshow(Q_s);
psnr(Q,Q_s);

% 提取
M_r = zeros(m,n);M_r=uint8(M_r);
M_r = M_r + mod(Q_s(1:m,1:n),4);
M_r = M_r + mod(Q_s(1:m,n+1:2*n),4) * 4;
M_r = M_r + mod(Q_s(m+1:2*m,1:n),4) * 4^2;
M_r = M_r + mod(Q_s(m+1:2*m,n+1:2*n),4) * 4^3;

imshow(Extract_secret(Q_s));

%% test insert and extract signature embedding 
clc;clear all
Signature = imread("Digital_signature\signature.tiff");
M = imread("Original_Images\Peppers.tiff");

M_1 = Signature_insert(M,Signature);
imshow(M_1);
psnr(M_1,M);


%% test permutation 
clc;clear all
keys = [0.2357, 1.254, 0.9871, 0.5871, 0.6201, 1.7321];

S = imread("Digital_signature\signature.tiff");
M = imread("Original_Images\Bridge.tiff");
C = imread("Original_Images\Pentagon.tiff");

S_1 = Permutation(S,keys(1:2));
imshow(S_1);
S_2 = InverPermutation(S_1,keys(1:2));
imshow(S_2);

M_1 = Permutation(M,keys(3:4));
imshow(M_1);
C_1 = Permutation(C,keys(5:6));
imshow(C_1);


M_2 = Signature_insert(M_1,S_1);

C_2 = Embed_secret(C_1,M_2);
C_3 = InverPermutation(C_2,keys(5:6));
imshow(C_3)

psnr(C_3,C)

%% extract M3
C_clip = C_3;C_clip(1:100,1:100) = 0;
C_3_p = Permutation(C_3,keys(5:6));
M_extract_2 = Extract_secret(C_3_p);
M_extract_1 = InverPermutation(M_extract_2,keys(3:4));
imshow(M_extract_1);

Signature_extract_2 = Signature_extract(M_extract_2);
Signature_extract_1 = InverPermutation(Signature_extract_2,keys(1:2));
figure
subplot(1,3,1)
imshow(C_3);
subplot(1,3,2)
imshow(M_extract_1);
subplot(1,3,3)
imshow(Signature_extract_1);
imshow(M);
psnr(M,M_extract_1);
