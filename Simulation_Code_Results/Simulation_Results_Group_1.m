%% test-1 LHJ & Bridge & Pentagon
clc;clear all
Key = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
x_0 = 2/3*Key(1)+1/6*Key(2)+1/6*Key(3);
y_0 = 1/4*Key(1)+1/2*Key(2)+1/4*Key(3);
z_0 = 1/5*Key(1)+1/5*Key(2)+3/5*Key(3);
r_1 = 2/3*Key(4)+1/6*Key(5)+1/6*Key(6);
r_2 = 1/4*Key(4)+1/2*Key(5)+1/4*Key(6);
r_3 = 1/5*Key(4)+1/5*Key(5)+3/5*Key(6);
keys = [x_0 y_0 z_0 r_1 r_2 r_3]

S = imread("Digital_signature\LHJ.tiff");
M = imread("Original_Images\Bridge.tiff");
C = imread("Original_Images\Pentagon.tiff");

tic
S_1 = Permutation(S,keys(1:2));

M_1 = Permutation(M,keys(3:4));

C_1 = Permutation(C,keys(5:6));

M_2 = Signature_insert(M_1,S_1);
C_2 = Embed_secret(C_1,M_2);
C_3 = InverPermutation(C_2,keys(5:6));

toc;
elapsedTime = toc;
fprintf('Encryption time: %.4f seconds.\n', elapsedTime);

%%
tic
C_2 = Permutation(C_3,keys(5:6));
M_extract_2 = Extract_secret(C_2);
M_extract_1 = InverPermutation(M_extract_2,keys(3:4));
Signature_extract_2 = Signature_extract(M_extract_2);
Signature_extract_1 = InverPermutation(Signature_extract_2,keys(1:2));

toc;
elapsedTime = toc;
fprintf('Decryption time: %.4f seconds.\n', elapsedTime);

%psnr(M_extract_1,M)

imwrite(M_1,"Group_1\Result_1\M_1.tiff");
imwrite(M_2,"Group_1\Result_1\M_2.tiff");
imwrite(C_1,"Group_1\Result_1\C_1.tiff");
imwrite(C_2,"Group_1\Result_1\C_2.tiff");
imwrite(C_3,"Group_1\Result_1\C_3.tiff");

imwrite(M_extract_2,"Group_1\Result_1\M_extract_2.tiff");
imwrite(M_extract_1,"Group_1\Result_1\M_extract_1.tiff");
imwrite(Signature_extract_2,"Group_1\Result_1\Signature_extract_2.tiff");
imwrite(Signature_extract_1,"Group_1\Result_1\Signature_extract_1.tiff");

%% psnr : 58.2522; Decryption time:0.2332s; Encryption time 0.4196s

%% Historm
[counts, binLocations] = imhist(C_3);

figure;
h = bar(binLocations, counts, 'FaceColor', 'flat');
ax = gca;

ax.XTick = [];

customMap = repmat(linspace(0, 1, 256)', [1, 3]); 
colormap(customMap);


cb = colorbar('peer', ax, 'Location', 'SouthOutside');

cb.Ticks = 0:50:255;
cb.TickLabels = num2cell(0:50:255);

caxis([0 255]);


%% Quality meansure 
% C and C_3: nc:0.9999 
% C and C_3 IE: 6.7327 6.6747
% M an M_extract psnr: 58.3044 dB

nc = NC(C,C_3)
psnr(M,M_extract_1);
IE(C)
IE(C_3);

%% Robustness 
% S&P nosiy 
% 0.001
C_sp = imnoise(C_3, "salt & pepper",0.001);
C_sp = Permutation(C_sp ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));

Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);


psnr(M_extract_1_sp,M_extract_1)
% 36.880
ssim(M_extract_1_sp,M_extract_1)
% 0.9864
NC(M_extract_1_sp,M_extract_1)
% 0.9999


% S&P nosiy 
% 0.005
C_sp = imnoise(C_3, "salt & pepper",0.005);
C_sp = Permutation(C_sp ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));

Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);

psnr(M_extract_1_sp,M_extract_1)
% 29.7335
ssim(M_extract_1_sp,M_extract_1)
% 0.9322
NC(M_extract_1_sp,M_extract_1)
% 0.9998


% S&P nosiy 
% 0.01
C_sp_1 = imnoise(C_3, "salt & pepper",0.001);
C_sp = Permutation(C_sp_1 ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));

Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);

NC(Signature_extract_1_sp,S)
psnr(M_extract_1_sp,M)
imwrite(M_extract_1_sp,"Group_1\Robustness\S&P\S&P_M_1.tiff");
imwrite(C_sp_1,"Group_1\Robustness\S&P\S&P_C_1.tiff")
% signature nc : 0.9896
% psnr secret : 26.7720

% S&P nosiy 
% 0.005
C_sp_1 = imnoise(C_3, "salt & pepper",0.005);
C_sp = Permutation(C_sp_1 ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));

Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);

NC(Signature_extract_1_sp,S);
psnr(M_extract_1_sp,M)
imwrite(M_extract_1_sp,"Group_1\Robustness\S&P\S&P_M_2.tiff");
imwrite(C_sp_1,"Group_1\Robustness\S&P\S&P_C_2.tiff")
% signature nc : 0.9911
% psnr secret : 29.8048


% S&P nosiy 
% 0.01
C_sp_1 = imnoise(C_3, "salt & pepper",0.01);
C_sp = Permutation(C_sp_1 ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));

Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);

NC(Signature_extract_1_sp,S)
psnr(M_extract_1_sp,M)

imwrite(M_extract_1_sp,"Group_1\Robustness\S&P\S&P_M_3.tiff");
imwrite(C_sp_1,"Group_1\Robustness\S&P\S&P_C_3.tiff")
% signature nc : 0.9921
% psnr secret : 36.6700

% image 
C_sp_1 = imnoise(C_3, "salt & pepper",0.001);
C_sp = Permutation(C_sp_1 ,keys(5:6));
M_extract_2_sp = Extract_secret(C_sp);
M_extract_1_sp = InverPermutation(M_extract_2_sp,keys(3:4));
Signature_extract_2_sp = Signature_extract(M_extract_2_sp);
Signature_extract_1_sp = InverPermutation(Signature_extract_2_sp,keys(1:2));
figure
subplot(1,2,1);
imshow(M_extract_1_sp);
subplot(1,2,2);
imshow(Signature_extract_1_sp);
imshow(C_sp_1 )
imwrite(Signature_extract_1_sp,"Group_1\Robustness\S&P\S&P_S_1.tiff")



% clip 100
C_clip_1 = C_3;
C_clip_1(1:100,1:100) = 0;
C_clip = Permutation(C_clip_1 ,keys(5:6));
M_extract_2_clip = Extract_secret(C_clip);
M_extract_1_clip = InverPermutation(M_extract_2_clip,keys(3:4));

Signature_extract_2_clip = Signature_extract(M_extract_2_clip);
Signature_extract_1_clip = InverPermutation(Signature_extract_2_clip,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_clip);
subplot(1,2,2);
imshow(Signature_extract_1_clip);

NC(Signature_extract_1_clip,S)
psnr(M_extract_1_clip,M)

imwrite(M_extract_1_clip,"Group_1\Robustness\Clip\clip_M_1.tiff");
imwrite(C_clip_1,"Group_1\Robustness\Clip\clip_C_1.tiff");
imwrite(Signature_extract_1_clip,"Group_1\Robustness\Clip\clip_S_1.tiff");
% signature nc : 0.9875
% psnr secret : 27.9762

% clip 200
C_clip_1 = C_3;
C_clip_1(1:200,1:200) = 0;
C_clip = Permutation(C_clip_1 ,keys(5:6));
M_extract_2_clip = Extract_secret(C_clip);
M_extract_1_clip = InverPermutation(M_extract_2_clip,keys(3:4));

Signature_extract_2_clip = Signature_extract(M_extract_2_clip);
Signature_extract_1_clip = InverPermutation(Signature_extract_2_clip,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_clip);
subplot(1,2,2);
imshow(Signature_extract_1_clip);

NC(Signature_extract_1_clip,S)
psnr(M_extract_1_clip,M)

imwrite(M_extract_1_clip,"Group_1\Robustness\Clip\clip_M_2.tiff");
imwrite(C_clip_1,"Group_1\Robustness\Clip\clip_C_2.tiff");
imwrite(Signature_extract_1_clip,"Group_1\Robustness\Clip\clip_S_2.tiff");
% signature nc : 0.9730
% psnr secret : 21.8553


% clip 400
C_clip_1 = C_3;
C_clip_1(1:400,1:400) = 0;
C_clip = Permutation(C_clip_1 ,keys(5:6));
M_extract_2_clip = Extract_secret(C_clip);
M_extract_1_clip = InverPermutation(M_extract_2_clip,keys(3:4));

Signature_extract_2_clip = Signature_extract(M_extract_2_clip);
Signature_extract_1_clip = InverPermutation(Signature_extract_2_clip,keys(1:2));

figure
subplot(1,2,1);
imshow(M_extract_1_clip);
subplot(1,2,2);
imshow(Signature_extract_1_clip);

NC(Signature_extract_1_clip,S)
psnr(M_extract_1_clip,M)

imwrite(M_extract_1_clip,"Group_1\Robustness\Clip\clip_M_3.tiff");
imwrite(C_clip_1,"Group_1\Robustness\Clip\clip_C_3.tiff");
imwrite(Signature_extract_1_clip,"Group_1\Robustness\Clip\clip_S_3.tiff");
% signature nc : 0.9139
% psnr secret : 15.5931
