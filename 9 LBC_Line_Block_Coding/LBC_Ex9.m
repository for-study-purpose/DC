clc;
clear all;
close all;

n = input('Enter the length of codeword(n):');
k = input('Enter the length of message bits(k):');
parity_matrix = input('Enter the parity matrix(size k x (n-k)):');

identity_matrix = eye(k);
generator_matrix=[identity_matrix, parity_matrix];
disp('The generator matrix (G) is:');
disp(generator_matrix);

messages=0:(2^k)-1;
binary_messages = de2bi(messages,k,'left-msb');
disp('Messages are:');
disp(binary_messages);

codewords = mod(binary_messages*generator_matrix,2);
disp('Codewords are:');
disp(codewords);

received_codeword = input('Enter received codeword:');

parity_transpose = parity_matrix';
identity_matrix_extended = eye(n-k);
parity_check_matrix = [parity_transpose, identity_matrix_extended];
parity_check_matrix_transpose = parity_check_matrix';

disp('The H transpose matrix is:');
disp(parity_check_matrix_transpose);

syndrome = mod(received_codeword*parity_check_matrix_transpose,2);
disp('The syndrome of the received codeword is:');
disp(syndrome);

if all(syndrome == 0) 
    disp('No error is present.');
else
    disp('Error is present, need for error correction.');

    error_patterns = eye(n);
    disp('Error pattern matrix is:');
    disp(error_patterns);

    syndrome_patterns = mod(error_patterns*parity_check_matrix_transpose,2); 
    disp('Syndrome patterns are:');
    disp(syndrome_patterns);

    [~, error_index] = ismember(syndrome, syndrome_patterns, 'rows');
    if (error_index > 0)
        corrected_codeword = xor(received_codeword, error_patterns(error_index, :));
        disp('Corrected codeword is:');
        disp(corrected_codeword);

        corrected_message = corrected_codeword(1:k);
        disp('The corrected message is:');
        disp(corrected_message);
    else 
        disp('Error pattern not found. Unable to correct.');
    end
end
