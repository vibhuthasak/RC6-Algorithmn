function y = quad32(x)
    % RC6 f(x) = (x*(2x+1)) mod 2^32, computed exactly in uint64.
    % Reduce both factors mod 2^32 first so the product stays below 2^64
    % and fits in uint64 (double loses precision above 2^53).
    m = uint64(4294967296);          % 2^32
    a = uint64(x);
    c = mod(uint64(2)*a + 1, m);     % (2x+1) mod 2^32
    y = double(mod(a*c, m));         % (x*(2x+1)) mod 2^32, exact
end
