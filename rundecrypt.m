function rundecrypt
    prompt1 = 'Enter the key(16digits)';
    key = input(prompt1,'s');
    keygen = Keygeneration(key);
    
    prompt2 = 'Enter the sentence(16digits)';
    encrypted_sentence = input(prompt2,'s');
    
    [orgi,cipher] = Decrypt(encrypted_sentence,keygen);
    cell_orgi = num2cell(orgi);
    decrypted_sentence = Deblocker(cell_orgi);
    decrypted_sentence
end