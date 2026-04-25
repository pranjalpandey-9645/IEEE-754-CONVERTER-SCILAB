clc;
clear;

function ieee754_converter(num)

    if num == 0 then
        disp("IEEE 754 Representation:");
        disp("Sign:0");
        disp("Exponent:00000000");
        disp("Mantissa:00000000000000000000000");
        disp("Full 32-bit: 0 00000000 00000000000000000000000");
        return;
    end

    // Sign bit
    if num < 0 then
        sign_bit = 1;
        num = abs(num);
    else
        sign_bit = 0;
    end

    // Separate integer and fraction
    int_part = floor(num);
    frac_part = num - int_part;

    int_bin = dec2bin(int_part);

    // Fraction to binary
    frac_bin = "";
    precision = 30;

    for i = 1:precision
        frac_part = frac_part * 2;
        if frac_part >= 1 then
            frac_bin = frac_bin + "1";
            frac_part = frac_part - 1;
        else
            frac_bin = frac_bin + "0";
        end
    end

    // Normalize
    if int_part <> 0 then
        exponent = length(int_bin) - 1;
        mantissa = part(int_bin, 2:length(int_bin)) + frac_bin;
    else
        first_one = strindex(frac_bin, "1");
        exponent = -first_one;
        mantissa = part(frac_bin, first_one+1:length(frac_bin));
    end

    // Add bias
    biased_exp = exponent + 127;
    exp_bin = dec2bin(biased_exp);

    while length(exp_bin) < 8
        exp_bin = "0" + exp_bin;
    end

    // Mantissa to 23 bits
    if length(mantissa) < 23 then
        while length(mantissa) < 23
            mantissa = mantissa + "0";
        end
    else
        mantissa = part(mantissa, 1:23);
    end

    // Output
    disp("IEEE 754 Representation:");
    disp("Sign     : " + string(sign_bit));
    disp("Exponent : " + exp_bin);
    disp("Mantissa : " + mantissa);
    disp("Full 32-bit: " + string(sign_bit) + " " + exp_bin + " " + mantissa);

endfunction

// MAIN
number = input("Enter a decimal number: ");
ieee754_converter(number);
