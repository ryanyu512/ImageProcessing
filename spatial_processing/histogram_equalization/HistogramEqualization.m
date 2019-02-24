function [out_image] = HistogramEqualization(image, max_scale)

% error handle
out_image = [];
image_size = size(image);
if (length(image_size) == 3 || max_scale > 255)
    return;
end

% get pixel value and its dimension
data = image(:);
data_len = length(data);

% get pixel probability
pixel_prob = zeros(256, 1);
for i = 1:data_len
    pixel_prob(data(i) + 1) = pixel_prob(data(i) + 1) + 1;
end
pixel_prob = pixel_prob/length(data);

% get pixel probability sum
pixel_prob_sum = zeros(256, 1);
pixel_prob_sum(1) = pixel_prob(1);
for i = 2:length(pixel_prob)
    pixel_prob_sum(i) = pixel_prob(i) + pixel_prob_sum(i - 1);
end

% enhance image
out_image = image;
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        idx = image(i, j) + 1;
        out_image(i, j) = sum(pixel_prob_sum(idx))*max_scale;
    end
end
end