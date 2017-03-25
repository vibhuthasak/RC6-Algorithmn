function runencrypt

    prompt1 = 'Enter the key(16digits)';
    key = input(prompt1,'s');
    keyforinput = key(1:16);
    keygen = Keygeneration(keyforinput);
    
    prompt2 = 'Enter the sentence(16digits)';
    sentence = input(prompt2,'s');
    senforinput = sentence(1:16);
    
    [orgi,cipher] = Encrypt(senforinput,keygen);
    cell_cipher = num2cell(cipher);
    encrypted_sentence = Deblocker(cell_cipher);
    encrypted_sentence

end