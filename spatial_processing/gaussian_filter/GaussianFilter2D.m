function img = GaussianFilter2D(img, kernel_size, sigma)

    
    [rows, cols, ~] = size(img);


    %% initialize kernel
    neighbor_size = floor(kernel_size/2);
    kernel_center = kernel_size - neighbor_size;
    kernel = zeros(kernel_size, kernel_size);
    
    kernel_sum = 0;
    for i = 1:kernel_size
        for j = 1:kernel_size
            dy = (i - kernel_center);
            dx = (j - kernel_center);

            kernel(i, j) = exp(-(dx^2 + dy^2)/sigma);
            kernel_sum = kernel_sum + kernel(i, j);
        end
    end
    kernel = kernel/kernel_sum;

    %% add gaussian filter to input image
    img2 = padarray(img, [neighbor_size, neighbor_size]);
    
    for i = 1:rows
        for j = 1:cols

            pixel_block = double(img2(i: i + kernel_size - 1, j: j + kernel_size - 1));
            conv = kernel.*pixel_block;
            img(i, j) = sum(conv(:));

        end
    end

end