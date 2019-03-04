clc;clear;close all;

path = 'D:\github\ImageProcessing\spatial_processing\data\';

img = rgb2gray(imread([path, 'lena.jpg']));

output = GaussianFilter2D(img, 5, 1);

figure;
imshowpair(img, output, 'montage');