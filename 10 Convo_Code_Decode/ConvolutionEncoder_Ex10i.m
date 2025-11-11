% Convolution Encoder

x = input('Enter number of outputs:');
f = input('Enter number of flip flops:');

trellis = struct('numInputSymbols', 2,'numOutputSymbols',4, ...
'numStates',4,'nextStates',[0 2; 2 3; 3 1; 1 3], ...
'outputs',[0 3; 3 0; 2 1; 1 2]);

n = input('Enter the number of message bits: ');
msg = zeros(1, n);
for i = 1:n
    msg(i) = input('Enter message bits: ');
end
code = convenc(msg, trellis);
fprintf('The convolution code is:\n');
for i = 1:length(code)
    fprintf('%d', code(i));
end

% ip=>  5, 3, 5, 1, 0, 1, 1, 0