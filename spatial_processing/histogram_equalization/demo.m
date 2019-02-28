clc; close all; close all;

%% load image
path = 'D:\github\ImageProcessing\spatial_processing\data\';
file_name = 'low_contrast_img2.png';
image = imread([path, file_name]);

%% convert to gray image
image_shape = size(image);
if (length(image_shape) == 3)
    image = rgb2gray(image);
end

%% historgram equalization
new_image = HistogramEqualization(image, 255);

if (isempty(new_image))
    return;
end

figure;imshowpair(image, new_image, 'montage');
imhist(new_image);