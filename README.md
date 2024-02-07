# screened_poisson_fft

Given an image of gradients $n_x, n_y$, and a screening image $\bar{f}$, solve for:

$$
\argmin_f \| \nabla_x f = \bar{n}_x \|_2^2 + \| \nabla_y f = \bar{n}_y \|_2^2 + 
\lambda \| f - \bar{f} \|_2^2
$$

This can be solved via FFT, as the system matrix is circulant.
See `GRAY, R. M. 2006. Toeplitz and circulant matrices: A review`