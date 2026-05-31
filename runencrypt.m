function runencrypt

    prompt1 = 'Enter the key (16 characters): ';
    key = input(prompt1,'s');
    keyforinput = key(1:16);
    keygen = Keygeneration(keyforinput);

    prompt2 = 'Enter the sentence (16 characters): ';
    sentence = input(prompt2,'s');
    senforinput = sentence(1:16);

    [orgi,cipher] = Encrypt(senforinput,keygen);
    cell_cipher = num2cell(cipher);
    encrypted_bytes = Deblocker(cell_cipher);

    % Print ciphertext as hex so it survives copy/paste (raw bytes may be
    % non-printable). 16 bytes -> 32 hex characters.
    encrypted_hex = sprintf('%02X', double(encrypted_bytes));
    fprintf('Encrypted (hex): %s\n', encrypted_hex);

end
