function rundecrypt
    prompt1 = 'Enter the key (16 characters): ';
    key = input(prompt1,'s');
    keyforinput = key(1:16);
    keygen = Keygeneration(keyforinput);

    prompt2 = 'Enter the encrypted hex (32 characters): ';
    encrypted_hex = input(prompt2,'s');

    % Decode the 32-char hex string back into the 16-byte string that
    % Decrypt expects (inverse of the hex printing in runencrypt).
    bytes = sscanf(encrypted_hex, '%2x');
    encrypted_sentence = char(bytes(:)');

    [orgi,cipher] = Decrypt(encrypted_sentence,keygen);
    cell_orgi = num2cell(orgi);
    decrypted_sentence = Deblocker(cell_orgi);
    fprintf('Decrypted: %s\n', decrypted_sentence);
end
