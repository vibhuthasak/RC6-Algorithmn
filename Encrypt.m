function [f_ori,f_cip] = Encrypt(sentence,s)
    encoded1 = encodetoblocks(sentence);
    
    A = bin2dec(encoded1(1));
    B = bin2dec(encoded1(2));
    C = bin2dec(encoded1(3));
    D = bin2dec(encoded1(4));
    
    orgi = zeros(1,4);
    orgi(1) = A;
    orgi(2) = B;
    orgi(3) = C;
    orgi(4) = D;
    
    r = 12;
    mod = 2.^32;
    lgw = 5;
    
    B = rem((B + s(1)),mod);
    D = rem((B + s(2)),mod);
  
    for i = 1:1:r+1
        t_temp = rem((B*(2*B + 1)),mod); 
        t = rotate_left(t_temp,lgw);
        u_temp = rem((D*(2*D + 1)),mod);
        u = rotate_left(u_temp,lgw);
        tmod = rem(t,32);
        umod = rem(u,32);
        
        A = rem((rotate_left(bitxor(A,t),umod) + s(2*i)),mod);
        C = rem((rotate_left(bitxor(C,u),tmod) + s(2*i+ 1)),mod);
        
        L = [B,C,D,A];
        A = L(1);
        B = L(2);
        C = L(3);
        D = L(4);
    end
    
    A = rem((A + s(2*r + 2)),mod); 
    C = rem((C + s(2*r + 3)),mod);
    
    cipher = zeros(1,4);
    cipher(1) = A;
    cipher(2) = B;
    cipher(3) = C;
    cipher(4) = D;

    f_ori = orgi;
    f_cip = cipher;
end