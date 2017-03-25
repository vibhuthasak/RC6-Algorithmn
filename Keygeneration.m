function s_fin = Keygeneration(userkey)
    r = 12;
    w = 32;
    b = length(userkey);
    mod = 2.^32;
    
    s = zeros(1,(2*r+4));
    
    initial_value = hex2dec('B7E15163');
    s(1) = initial_value;
    
    for i = 2:1:((2*r+4))
        s(i)= rem((s(i-1)+hex2dec('9E3779B9')),(2.^w));
    end
    
    encoded = encodetoblocks(userkey);
    enlength = length(encoded);
    
    l = zeros(1,enlength);
    
    for i = 0:1:(enlength-1)
        l (enlength-i) = bin2dec(encoded(i+1));
    end
    
    v = 3*max(enlength,(2*r+4));
    
    A = 0;
    B = 0;
    i1=1;
    j1=1;
    
    for index =(1:v)
        A = s(i1);
        B = l(j1);
        s(i1) = rotate_left(rem((s(i1) + A + B),mod),3);
        l(j1) = rotate_left(rem((l(j1) + A + B),mod),rem((A+B),32)); 
        i1 = rem((i1 + 1),(2*r + 4))+1;
        j1 = rem((j1 + 1),enlength)+1;
    end
    s_fin = s;
end