function [f_cip,f_ori] = Decrypt(encrypted_sentence,s)
    encoded = encodetoblocks(encrypted_sentence);
    
    A = bin2dec(encoded(1));
    B = bin2dec(encoded(2));
    C = bin2dec(encoded(3));
    D = bin2dec(encoded(4));
    
    cipher = zeros(1,4);
    cipher(1) = A;
    cipher(2) = B;
    cipher(3) = C;
    cipher(4) = D;
    
    r = 20;
    mod = 2.^32;
    lgw = 5;

    C = rem((C - s(2*r+3) + mod),mod);
    A = rem((A - s(2*r+2) + mod),mod);
    
    for j = 1:r
        i = (r+1)-j;
        L = [D,A,B,C];
        A = L(1);
        B = L(2);
        C = L(3);
        D = L(4);
        u = rotate_left(quad32(D),lgw);
        t = rotate_left(quad32(B),lgw);
        tmod = rem(t,32);
        umod = rem(u,32);
       
        C = bitxor((rotate_right(rem((C-s(2*i+1) + mod),mod),tmod)),u);
        A = bitxor(rotate_right(rem((A-s(2*i) + mod),mod),umod),t);
        
    end
    
    D = rem((D - s(2) + mod),mod);
    B = rem((B - s(1) + mod),mod);
    
    orgi = zeros(1,4);
    orgi(1) = A;
    orgi(2) = B;
    orgi(3) = C;
    orgi(4) = D;

    f_ori = orgi;
    f_cip = cipher;
end