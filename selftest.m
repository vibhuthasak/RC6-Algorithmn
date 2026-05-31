function selftest
    % RC6 round-trip self-test: encrypt then decrypt many random
    % 16-byte plaintexts with random 16-byte keys and confirm the
    % original plaintext is recovered exactly. Expect 100% pass.
    trials = 1000;
    fails = 0;
    for k = 1:trials
        key   = char(randi([33 126], 1, 16));   % printable 16-byte key
        plain = char(randi([33 126], 1, 16));   % printable 16-byte block

        sg = Keygeneration(key);
        [~, cipher]    = Encrypt(plain, sg);
        ctext          = Deblocker(num2cell(cipher));
        [~, recovered] = Decrypt(ctext, sg);
        out            = Deblocker(num2cell(recovered));

        if ~isequal(out, plain)
            fails = fails + 1;
            if fails <= 5
                fprintf('FAIL  key="%s"  plain="%s"  got="%s"\n', key, plain, out);
            end
        end
    end
    fprintf('\n%d/%d passed (%d failed)\n', trials - fails, trials, fails);
    if fails == 0
        fprintf('RC6 round-trip is 100%%.\n');
    end
end
