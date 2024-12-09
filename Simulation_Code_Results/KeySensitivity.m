%% key sensitivity
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



%% key change
% key_1
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(1) = Key_1(1) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

imwrite(M_extract_c_1,"KeySensitivity\M_k_1.tiff");
imwrite(Signature_extract_c_1,"KeySensitivity\S_k_1.tiff");

% key_2
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(2) = Key_1(2) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

imwrite(M_extract_c_1,"KeySensitivity\M_k_2.tiff");
imwrite(Signature_extract_c_1,"KeySensitivity\S_k_2.tiff");

% key_3
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(3) = Key_1(3) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

% imwrite(M_extract_c_1,"KeySensitivity\M_k_3.tiff");
% imwrite(Signature_extract_c_1,"KeySensitivity\S_k_3.tiff");

% key_4
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(4) = Key_1(4) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

% imwrite(M_extract_c_1,"KeySensitivity\M_k_4.tiff");
% imwrite(Signature_extract_c_1,"KeySensitivity\S_k_4.tiff");


% key_5
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(5) = Key_1(5) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

% imwrite(M_extract_c_1,"KeySensitivity\M_k_5.tiff");
% imwrite(Signature_extract_c_1,"KeySensitivity\S_k_5.tiff");

% key_6
Key_1 = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
Key_1(6) = Key_1(6) + 0.000001;
x_0 = 2/3*Key_1(1)+1/6*Key_1(2)+1/6*Key_1(3);
y_0 = 1/4*Key_1(1)+1/2*Key_1(2)+1/4*Key_1(3);
z_0 = 1/5*Key_1(1)+1/5*Key_1(2)+3/5*Key_1(3);
r_1 = 2/3*Key_1(4)+1/6*Key_1(5)+1/6*Key_1(6);
r_2 = 1/4*Key_1(4)+1/2*Key_1(5)+1/4*Key_1(6);
r_3 = 1/5*Key_1(4)+1/5*Key_1(5)+3/5*Key_1(6);
keys_1 = [x_0 y_0 z_0 r_1 r_2 r_3];

C_c_2 = Permutation(C_3,keys_1(5:6));
M_extract_c_2 = Extract_secret(C_c_2);
M_extract_c_1 = InverPermutation(M_extract_c_2,keys_1(3:4));
Signature_extract_c_2 = Signature_extract(M_extract_c_2);
Signature_extract_c_1 = InverPermutation(Signature_extract_c_2,keys_1(1:2));

figure
subplot(2,2,1)
imshow(M_extract_1)
subplot(2,2,2)
imshow(M_extract_c_1)
subplot(2,2,3)
imshow(Signature_extract_1)
subplot(2,2,4)
imshow(Signature_extract_c_1)

% imwrite(M_extract_c_1,"KeySensitivity\M_k_6.tiff");
% imwrite(Signature_extract_c_1,"KeySensitivity\S_k_6.tiff");

