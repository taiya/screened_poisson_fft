function Is = screenedpoisson(Ib, ux, uy, gamma)

Il_size = size(Ib);
IB = fft2(Ib);
DX = psf2otf([1,-1] ,Il_size);
DY = psf2otf([1,-1]',Il_size);
UX = fft2(ux);
UY = fft2(uy);
NUM = conj(DX).*UX + conj(DY).*UY + gamma.*IB;
DEN = conj(DX).*DX + conj(DY).*DY + gamma;
Is = real(ifft2(NUM./DEN));