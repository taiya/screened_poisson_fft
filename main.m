clc, clear, close all

if false
    % --- Example1: real data
    % normalize data to [0,1] and flatten to grayscale
    I = imread("input.png"); %#ok<*UNRCH>
    M = imread("mask.png");
    I = double(I) / 255.0;
    M = double(M) / 255.0;
    I = mean(I,3);
    M = mean(M,3);
else
    % --- Example1: real data
    [XX, YY] = meshgrid(-2:.01:+2, -2:.01:+2);
    M = (sqrt(XX.^2 + YY.^2) - 1) < 0;
    I = .5 + .5*sin(4*XX);
end


figure(1), imshow(I), axis("image")
figure(2), imshow(M), axis("image")

% --- compute gradients (and trim them with mask)
[ux, uy] = imgradients(I);
% [ux, uy] = imgradient(I, "central"); %< DO NOT USE THIS!
ux = ux .* (1-M);
uy = uy .* (1-M);
figure(3), imshowpair(ux*255, uy*255, "montage");

% --- screening term
% just says average color of image should be .5
I_screen = .5 * ones(size(I));

% --- perform poisson integration
O = screenedpoisson(I_screen, ux, uy, 1e-5);

% --- check solution is set around screening value
mean(O(:))

% --- normalize after solve (to make imshow happy)
O = O - min(O(:));
O = O / max(O(:));

figure(4), imshow(O)
figure(5), mesh(mean(O,3))