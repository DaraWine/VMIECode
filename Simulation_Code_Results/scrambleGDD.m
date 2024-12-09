
%% GDD
clc;clear all
Key = [0.0157, 1.254, 0.8871, 0.1871, 0.9201, 1.7321];
x_0 = 2/3*Key(1)+1/6*Key(2)+1/6*Key(3);
y_0 = 1/4*Key(1)+1/2*Key(2)+1/4*Key(3);
z_0 = 1/5*Key(1)+1/5*Key(2)+3/5*Key(3);
r_1 = 2/3*Key(4)+1/6*Key(5)+1/6*Key(6);
r_2 = 1/4*Key(4)+1/2*Key(5)+1/4*Key(6);
r_3 = 1/5*Key(4)+1/5*Key(5)+3/5*Key(6);
keys = [x_0 y_0 z_0 r_1 r_2 r_3]

% ours
M = imread("Original_Images\Cammeraman.tiff");
M_1 = Permutation(M,keys(3:4));
abs(GDD(M,M_1))
GDD_our = [abs(GDD(M,M_1))];

M = imread("Original_Images\Peppers.tiff");
M_1 = Permutation(M,keys(3:4));
GDD(M,M_1);
GDD_our = [GDD_our abs(GDD(M,M_1))]

M = imread("Original_Images\5.2.08.tiff");
M_1 = Permutation(M,keys(3:4));
GDD(M,M_1)
GDD_our = [GDD_our abs(GDD(M,M_1))]

M = imread("Original_Images\elaine.512.tiff");
M_1 = Permutation(M,keys(3:4));
GDD(M,M_1);
GDD_our = [GDD_our abs(GDD(M,M_1))];
GDD_our 

% Arnold
M = imread("Original_Images\Cammeraman.tiff");
M_1= Arnold(M);
GDD_Arnold = [abs(GDD(M,M_1))];

M = imread("Original_Images\Peppers.tiff");
M_1= Arnold(M);
GDD_Arnold = [GDD_Arnold abs(GDD(M,M_1))];

M = imread("Original_Images\5.2.08.tiff");
M_1= Arnold(M);
GDD_Arnold = [GDD_Arnold abs(GDD(M,M_1))];

M = imread("Original_Images\elaine.512.tiff");
M_1= Arnold(M);
GDD_Arnold = [GDD_Arnold abs(GDD(M,M_1))];
GDD_Arnold 

% Zigzag
M = imread("Original_Images\Cammeraman.tiff");
M_1= Zigzag(M);
GDD_Zigzag = [abs(GDD(M,M_1))];

M = imread("Original_Images\Peppers.tiff");
M_1= Zigzag(M);
GDD_Zigzag = [GDD_Zigzag abs(GDD(M,M_1))];

M = imread("Original_Images\5.2.08.tiff");
M_1= Zigzag(M);
GDD_Zigzag = [GDD_Zigzag abs(GDD(M,M_1))];

M = imread("Original_Images\elaine.512.tiff");
M_1= Zigzag(M);
GDD_Zigzag = [GDD_Zigzag abs(GDD(M,M_1))];
GDD_Zigzag;

GDD_ref = [0.8858 0.9059 0.8965 0.7009]

figure
Y = [GDD_Arnold',GDD_Zigzag',GDD_ref',GDD_our']
b=bar(Y);
set(gca,'XTickLabel',{'Cammeraman','Peppers','Livingroom','Elaine'})
legend('Arnold scrambling','Zigzag scrambling', 'Zhang et. al^{48}', 'ours');
xlabel('Images');
ylabel('GDD');
legend

colors = [1 0 0; 0 1 0; 0 0 1; 1 0 1]; 
colorMat = repmat(colors, 1, length(Y)/4);

b = bar(Y, 'FaceColor', 'flat');



