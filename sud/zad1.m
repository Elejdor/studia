clear all;

sampleRate = 0.1;
time = 10;

A = 1;
f = 0.2;
nBits = 2^4;

t = 0:sampleRate:time;

%generate analog signal (sinus)

analog = A*sin(2*pi*f*t);
quantized = uencode(analog, log2(nBits));

%draw figure 1

figure(1);
stem(t, analog, 'r');
hold on;
stem(t, quantized);
hold off;

%digitalize signal

digitalized = transpose(dec2bin(quantized, log2(nBits)));

reshaped = reshape(digitalized, 1, numel(digitalized));
plot_bin = str2num(reshaped(:));

offsetTime = (sampleRate/log2(nBits))*(log2(nBits)-1);
scale_bin = 0:sampleRate/log2(nBits):time+offsetTime;

%draw figure 2
figure(2);
stairs(t, quantized);
hold on;
stairs(scale_bin, plot_bin+(nBits/2), 'r');
hold off;

% Etap 3
k = 15;

%zak³ócenie sygna³u
plot_bin_dist = plot_bin;
for i=1:numel(plot_bin_dist)
    if (mod(i, k) == 0)
        plot_bin_dist(i, 1) = 1;
    end
end

plot_bin_reshaped = reshape(num2str(plot_bin_dist), log2(nBits), numel(plot_bin_dist)/log2(nBits)); % Przetwarzanie

out = bin2dec(transpose(plot_bin_reshaped)); % Przetwarzanie

% Rysowanie wykresów na Figure 3

figure(3);
stairs(t, out);
