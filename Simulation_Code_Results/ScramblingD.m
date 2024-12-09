%% d
% our
clc;clear all
Key = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
x_0 = 2/3*Key(1)+1/6*Key(2)+1/6*Key(3);
y_0 = 1/4*Key(1)+1/2*Key(2)+1/4*Key(3);
z_0 = 1/5*Key(1)+1/5*Key(2)+3/5*Key(3);
r_1 = 2/3*Key(4)+1/6*Key(5)+1/6*Key(6);
r_2 = 1/4*Key(4)+1/2*Key(5)+1/4*Key(6);
r_3 = 1/5*Key(4)+1/5*Key(5)+3/5*Key(6);
keys = [x_0 y_0 z_0 r_1 r_2 r_3]


M = imread("Original_Images\Jet.tif");

M_1 = Permutation(M,keys(3:4));

clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverPermutation(M_2,keys(3:4));
%imwrite(M_r,"Scrambling\oursClip.tiff")

d_ours = D(M_1,M_r)

% Arnold
M_1 = Arnold(M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverArnold(M_2);
imwrite(M_r,"Scrambling\ArnoldClip.tiff")
imshow(M_r)

d_Arnold = D(M_1,M_r)

% Zigzag
M_1 = Zigzag(M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverZigZag(M_2);
imshow(M_r)

d_Zigzag = D(M_1,M_r);
imwrite(M_r,"Scrambling\ZigzagClip.tiff")

% Circular 
M_1 = Circular (M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverCircular(M_2);
imshow(M_r)

d_Circular = D(M_1,M_r);
imwrite(M_r,"Scrambling\Circular Clip.tiff")

d_list_1 = [d_Arnold,d_Zigzag,d_Circular,d_ours];


% livingroom
M = imread("Original_Images\elaine.512.tiff");

M_1 = Permutation(M,keys(3:4));

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverPermutation(M_2,keys(3:4));


d_ours = D(M_1,M_r)

% Arnold
M_1 = Arnold(M);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverArnold(M_2);

imshow(M_r)

d_Arnold = D(M_1,M_r)

% Zigzag
M_1 = Zigzag(M);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverZigZag(M_2);
imshow(M_r)

d_Zigzag = D(M_1,M_r)


% Circular 
M_1 = Circular (M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverCircular(M_2);
imshow(M_r)

d_Circular = D(M_1,M_r);

d_list_2 = [d_Arnold,d_Zigzag,d_Circular,d_ours];

% Goldhill
M = imread("Original_Images\Goldhill.tif");

M_1 = Permutation(M,keys(3:4));

clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverPermutation(M_2,keys(3:4));


d_ours = D(M_1,M_r)

% Arnold
M_1 = Arnold(M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverArnold(M_2);

imshow(M_r)

d_Arnold = D(M_1,M_r)

% Zigzag
M_1 = Zigzag(M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverZigZag(M_2);
imshow(M_r)

d_Zigzag = D(M_1,M_r);


% Circular 
M_1 = Circular (M);
clip_1 = reshape(M_1(1:512,1:50),1,512*50);
clip_2 = reshape(M_1(1:512,463:512),1,512*50);
clip_3 = reshape(M_1(1:50,51:462),1,412*50);
clip_4 = reshape(M_1(463:512,51:462),1,412*50);

clip_1 = unique(clip_1);
clip_2 = unique(clip_2);
clip_3 = unique(clip_3);
clip_4 = unique(clip_4);

clip = unique([clip_1, clip_2, clip_3, clip_4]);

M_2 = M_1;
M_2(1:512,1:50) = 0;
M_2(1:512,463:512) = 0;
M_2(1:50,51:462) = 0;
M_2(463:512,51:462) = 0;

M_r = InverCircular(M_2);
imshow(M_r)

d_Circular = D(M_1,M_r);

d_list_3 = [d_Arnold,d_Zigzag,d_Circular,d_ours];


d_list = [d_list_2;d_list_1;d_list_3];
d_list = d_list';
D_Arnold = d_list(1,:);
D_Zigzag = d_list(2,:);
D_Circular = d_list(3,:);
D_ours = d_list(4,:);



figure
x=1:3;

plot(x,D_Arnold,'--diamondb',...
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b');
hold on;
plot(x,D_Zigzag,'--+c',...
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','c');
hold on;
plot(x,D_Circular,'--og',...
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','g');
hold on;
plot(x,D_ours,'--^m',...
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','m');%y2系列折线的线形、标记形状、折线颜色、线粗细、标记大小、标记颜色
hold on;

axis([1,3,0,1])  
set(gca,'XTick',[1:1:3]) %x轴起始-间隔-终值
set(gca,'XTickLabel',{'Peppers','Jet','Goldhill'})
%set(gca,'XTickLabelRotation',45)
set(gca,'YTick',[0:0.2:1]) 
% set(gca,'linewidth',1.5)
legend('Arnold-based scrambling','Zigzig-based scrambling','Circular shift scrambling','ours');  
xlabel('Image')  
ylabel('D') 
