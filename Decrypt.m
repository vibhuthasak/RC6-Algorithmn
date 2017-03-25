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
    
    r = 12;
    mod = 2.^32;
    lgw = 5;
   
    C = rem((C - s(2*r+3)),mod);
    A = rem((A - s(2*r+2)),mod);
    
    for j = 1:r
        i = (r+1)-j;
        L = [D,A,B,C];
        A = L(1);
        B = L(2);
        C = L(3);
        D = L(4);
        u_temp = rem((D*(2*D+1)),mod);
        u = rotate_left(u_temp,lgw);
        t_temp = rem((B*(2*B+1)),mod);
        t = rotate_left(t_temp,lgw);
        tmod = rem(t,32);
        umod = rem(t,32);
       
        C = bitxor((rotate_right(rem((C-s(2*i+1)),mod),tmod)),u);
        A = bitxor(rotate_right(rem((A-s(2*i)),mod),umod),t);
        
    end
    
    D = rem((D - s(2)),mod);
    B = rem((B - s(1)),mod);
    
    orgi = zeros(1,4);
    orgi(1) = A;
    orgi(2) = B;
    orgi(3) = C;
    orgi(4) = D;

    f_ori = orgi;
    f_cip = cipher;
end