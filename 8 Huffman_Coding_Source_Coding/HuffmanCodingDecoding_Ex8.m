clc;
clear all;
close all;

x = input("Enter the number of symbols: ");

symbols = zeros(1, x);
p = zeros(1, x);

for m = 1:x
    symbols(m) = input("Enter the symbol number: ");
    p(m) = input("Enter the probability: ");
end

if abs(sum(p) - 1) > 1e-6
    error('Probabilities must sum to 1.');
end

Hx = -sum(p .* log2(p));

[dict, avglen] = huffmandict(symbols, p);

message = symbols;

hcode = huffmanenco(message, dict);
disp('Encoded Huffman Code:');
disp(hcode);

dsig = huffmandeco(hcode, dict);
disp('Decoded Signal:');
disp(dsig);

code_length = length(hcode);
disp(['Code Length: ', num2str(code_length)]);

disp(['Entropy (Hx): ', num2str(Hx)]);

Efficiency = (Hx / avglen) * 100;
disp(['Efficiency: ', num2str(Efficiency), '%']);
