function runencrypt

    prompt1 = 'Enter the key(16digits)';
    key = input(prompt1,'s');
    keygen = Keygeneration(key);
    
    prompt2 = 'Enter the sentence(16digits)';
    sentence = input(prompt2,'s');
    
    [orgi,cipher] = Encrypt(sentence,keygen);
    cell_cipher = num2cell(cipher);
    cell_cipher
    encrypted_sentence = Deblocker(cell_cipher);
    encrypted_sentence

end