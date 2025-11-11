clc;
clear all;
close all;

x = input('Enter The Sequence X: ');
h = input('Enter The Sequence h: ');

subplot(3,1,1);
stem(x);
title('Sequence X');
xlabel('Samples');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(h);
title('Sequence h');
xlabel('Samples');
ylabel('Amplitude');
grid on;

y = fliplr(h);

C = conv(x, y);

subplot(3,1,3);
stem(C);
title('Cross-Correlation Result');
xlabel('Samples');
ylabel('Amplitude');
grid on;

% ip - [2 3 4] , [2 3 5]