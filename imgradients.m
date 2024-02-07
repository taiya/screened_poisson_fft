function [X, Y] = imgradients(I)

im_size = size(I);
DX = psf2otf([1,-1] ,im_size);
DY = psf2otf([1,-1]',im_size);
X = real(ifft2(DX.*fft2(I)));
Y = real(ifft2(DY.*fft2(I)));