import random
import numpy as np
import matplotlib.pyplot as plt
import time

# Custom Imports
import UniformSampling

# # -- For unique display
# u = np.random.uniform(0,1,2000000)
# v = np.random.uniform(0,1,2000000)
#
# fig = plt.figure()
# plot = fig.add_subplot(1,1,1)
#
# # Duration evaluation
# start_time = time.time()
# r = UniformSampling.random_cosine(u, v, 0)  # Modify this line to invoke different methods
# print("--- %s seconds ---" % (time.time() - start_time))
# heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
#
# im = plot.imshow(heatmap)
#
# fig.subplots_adjust(right=0.8)
# cbar_ax = fig.add_axes([0.85, 0.15, 0.05, 0.7])
# fig.colorbar(im, cax=cbar_ax)
#
# plt.show()

# -- Multiple displays
u = np.random.uniform(0,1,2000000)
v = np.random.uniform(0,1,2000000)


# Init the figure
fig = plt.figure()
axes = [fig.add_subplot(231),
        fig.add_subplot(232),
        fig.add_subplot(233),
        fig.add_subplot(234),
        fig.add_subplot(235),
        fig.add_subplot(236)]

# Draw the plots
r = UniformSampling.random_spherical(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[0].imshow(heatmap)
# axes[0].axis('off')

r = UniformSampling.random_rejection(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[1].imshow(heatmap)
axes[1].axis('off')

r = UniformSampling.random_polar(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[2].imshow(heatmap)
axes[2].axis('off')

r = UniformSampling.random_concentric(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[3].imshow(heatmap)
axes[3].axis('off')

r = UniformSampling.random_uniform_cosine(u, v)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[4].imshow(heatmap)
axes[4].axis('off')

r = UniformSampling.random_cosine(u, v, 5)
heatmap, xedges, yedges = np.histogram2d(r[0], r[1], bins=100)
axes[5].imshow(heatmap)
axes[5].axis('off')

plt.show()
