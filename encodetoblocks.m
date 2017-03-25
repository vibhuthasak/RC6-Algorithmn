function encoded_vect1 = encodetoblocks(stri)
    encode_val = '';
    re = '';
    for i = (1:1:length(stri))
        if and(rem(i,4)==0,i~=0)
            encode_val = strcat(encode_val,re);
            re = '';
        end
        temp = dec2bin(stri(i),8);
        re = strcat(re,temp);
    end
    
    encoded_val = strcat(encode_val,re);
    length(encoded_val)
    encoded_vect = cell(1,4);
    %length(encoded_val)
    encoded_vect(1) = {encoded_val(1:32)};
    encoded_vect(2) = {encoded_val(33:64)};
    encoded_vect(3) = {encoded_val(64:96)};
    encoded_vect(4) = {encoded_val(96:length(encoded_val))};
    encoded_vect1 = encoded_vect;
end