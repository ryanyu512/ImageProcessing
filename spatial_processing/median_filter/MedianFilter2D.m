function out_img = MedianFilter2D(img, mask_size)

    out_img = img;
    mask_size = floor(mask_size);
    if (rem(mask_size, 2) == 0)
        display('mask size is not correct');
        return;
    end
        
    half_dims = (mask_size - 1)/2;
    
    [rows, cols] = size(img);
    
    d_x = zeros(mask_size, mask_size);
    d_y = zeros(mask_size, mask_size);
    for i = 1:mask_size
        for j = 1:mask_size
            d_x(i,j) = -half_dims + j - 1;
            d_y(i,j) = -half_dims + i - 1;
        end
    end
    
    d_x = reshape(d_x, mask_size*mask_size, 1);
    d_y = reshape(d_y, mask_size*mask_size, 1);
    
    med_idx = floor(mask_size^2/2) + 1;
    for i = 1 + half_dims:rows - half_dims
        for j = 1 + half_dims:cols - half_dims
            mask_idx  = (j - 1 + d_x)*rows + (i + d_y);
            cur_idx   = mask_idx(med_idx);
            mask_val = sort(img(mask_idx));     
            out_img(cur_idx) = mask_val(med_idx); 
        end
    end 
    
    out_img = reshape(out_img, rows, cols);
end