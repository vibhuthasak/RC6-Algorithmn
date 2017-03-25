function sr = Deblocker(blocks)
    s= '';
    blocks;
    len = length(blocks);
    for i=1:len
        value = blocks{i};
        temp = dec2bin(value,8);
        arc = 32-(length(temp));
        if length(temp) < 32
            zeroadd = '0';
            for j= 1:(arc-1)
                zeroadd = strcat(zeroadd,'0');
            end
            temp = strcat(zeroadd,temp);
        end
        slittemp = cellstr(reshape(temp,8,[])');
        for j = 1:4
            slittemp{j};
            dec_sli = bin2dec(slittemp{j});
            chartemp = char(dec_sli);
            s = strcat(s,chartemp);
        end
    end
     sr = s;
end
    
            
            
            
            
        
        
        