clc;
clear all;
close all;

x = input('Enter the Sequence X: ');

subplot(3,1,1);
stem(x);
title('Origin Sequence');
xlabel('Samples');
ylabel('Amplitude');
grid on;

y = fliplr(x);

subplot(3,1,2);
stem(y);
title('Reversed Sequence');
xlabel('Samples');
ylabel('Amplitude');
grid on;

c = conv(x, y);

subplot(3,1,3);
stem(c);
title('Autocorrelation Result');
xlabel('Samples');
ylabel('Amplitude');
grid on;