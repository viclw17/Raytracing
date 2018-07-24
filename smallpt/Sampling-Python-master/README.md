# Articles
This repository is linked to a series of articles, come have a look:
 * http://thomaspoulet.fr/uniform-sampling-on-unit-hemisphere/

# Documentation
*Coming soon*

# Note

## What is NumPy?
[NumPy](http://www.numpy.org/) is the fundamental package for scientific computing in Python. It is a Python library that provides a multidimensional array object, various derived objects (such as masked arrays and matrices), and an assortment of routines for fast operations on arrays, including mathematical, logical, shape manipulation, sorting, selecting, I/O, discrete Fourier transforms, basic linear algebra, basic statistical operations, random simulation and [much more](https://docs.scipy.org/doc/numpy/reference/index.html).

```
r = UniformSampling.random_spherical(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[0].imshow(heatmap)
axes[0].axis('off')

# Generate a random point on a sphere using spherical coordinates
def random_spherical(u, v):
    # Correct Range [0;pi] [-pi;pi]
    theta = u * np.pi
    phi = (v * np.pi * 2) - np.pi

    # Switch to cartesian coordinates
    x = np.sin(theta) * np.cos(phi)
    y = np.cos(theta) * np.cos(phi)

    return x, y
```
numpy.histogram2d(x, y, bins=10, range=None, normed=False, weights=None)
**Compute the bi-dimensional histogram of two data samples.**

Parameters:
- x : array_like, shape (N,) An array containing the x coordinates of the points to be histogrammed.
- y : array_like, shape (N,) An array containing the y coordinates of the points to be histogrammed.
- bins : int or array_like or [int, int] or [array, array], optional

The bin specification:
- If int, the number of bins for the two dimensions (nx=ny=bins).
- If array_like, the bin edges for the two dimensions (x_edges=y_edges=bins).
- If [int, int], the number of bins in each dimension (nx, ny = bins).
- If [array, array], the bin edges in each dimension (x_edges, y_edges = bins).
- A combination [int, array] or [array, int], where int is the number of bins and array is the bin edges.

- range : array_like, shape(2,2), optional
    - The leftmost and rightmost edges of the bins along each dimension (if not specified explicitly in the bins parameters): [[xmin, xmax], [ymin, ymax]]. All values outside of this range will be considered outliers and not tallied in the histogram.
- normed : bool, optional
    - If False, returns the number of samples in each bin. If True, returns the bin density bin_count / sample_count / bin_area.
- weights : array_like, shape(N,), optional
    - An array of values w_i weighing each sample (x_i, y_i). Weights are normalized to 1 if normed is True. If normed is False, the values of the returned histogram are equal to the sum of the weights belonging to the samples falling into each bin.

**Returns**:
- H : ndarray, shape(nx, ny)
    - The bi-dimensional histogram of samples x and y. Values in x are histogrammed along the first dimension and values in y are histogrammed along the second dimension.
- xedges : ndarray, shape(nx+1,)
    - The bin edges along the first dimension.
- yedges : ndarray, shape(ny+1,)
    - The bin edges along the second dimension.
