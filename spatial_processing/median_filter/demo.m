clc;clear;close all;

path = 'D:\github\ImageProcessing\spatial_processing\data\';

I = rgb2gray(imread([path,'coin_img.jpg']));

J = imnoise(I, 'salt & pepper', 0.02);

new_img = MedianFilter2D(J, 3);

figure(1);
imshowpair(J, new_img, 'montage');