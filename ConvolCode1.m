clc;
clear;
close all;

% Input data
data = [1 0 1 1 0 1];

% Initial memory
m1 = 0;
m2 = 0;

% Output initialize
x1 = [];
x2 = [];

% Convolutional Encoding
for i = 1:length(data)

    m = data(i);

    % Encoder equations
    a = xor(xor(m,m1),m2);
    b = xor(m,m2);

    % Store output
    x1 = [x1 a];
    x2 = [x2 b];

    % Update memory
    m2 = m1;
    m1 = m;

end

% Combine outputs
encoded = reshape([x1; x2],1,[]);

% Display results
disp('Input Data:');
disp(data);

disp('X1 Output:');
disp(x1);

disp('X2 Output:');
disp(x2);

disp('Encoded Data:');
disp(encoded);