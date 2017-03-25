function result = rotate_right(x,n)
    bits = 32;
    mask = (2.^n) - 1;
    mask_bits = bitand(x,mask);
    rshift = bitshift(x,-n);
    lshift = bitshift(mask_bits,(bits-n));
    result = bitor(rshift,lshift);
end
   
