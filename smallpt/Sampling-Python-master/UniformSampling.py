import numpy as np

__author__ = 'Thomas'


# Generate a random point on a sphere using spherical coordinates
def random_spherical(u, v):
    # Correct Range [0;pi] [-pi;pi]
    theta = u * np.pi
    phi = (v * np.pi * 2) - np.pi

    # Switch to cartesian coordinates
    x = np.sin(theta) * np.cos(phi)
    y = np.cos(theta) * np.cos(phi)

    return x, y


# Generate a random point on a hemisphere using Shirley concentric mapping
def random_concentric(u, v):
    x = []
    y = []

    # Correct range [-1;1]
    u = 2 * u - 1
    v = 2 * v - 1

    for i, val in enumerate(u):
        a = u[i]
        b = v[i]

        if a > -b:
            if a > b:  # Region 1
                r = a
                phi = (np.pi / 4) * (b / a)
            else:  # Region 2
                r = b
                phi = (np.pi / 4) * (2 - (a / b))
        else:
            if a < b:  # Region 3
                r = -a
                phi = (np.pi / 4) * (4 + (b / a))
            else:  # Region 4
                r = -b
                if b != 0:
                    phi = (np.pi / 4) * (6 - (a / b))
                else:
                    phi = 0

        x.append(r * np.cos(phi))
        y.append(r * np.sin(phi))

    return x, y


# Generate a random point on a disc using rejection method
def random_rejection(u, v):
    x = []
    y = []

    # Correct range [-1;1]
    u = 2 * u - 1
    v = 2 * v - 1

    for i, val in enumerate(u):
        r = np.sqrt(np.square(u[i]) + np.square(v[i]))
        if r < 1:
            x.append(u[i])
            y.append(v[i])

    return x, y


# Generate a random point on a disc using polar coordinates
def random_polar(u, v):
    # Correct Range [-pi;pi] [-pi;pi]
    theta = (u * np.pi * 2) - np.pi
    r = v

    # Switch to cartesian coordinates
    x = r * np.cos(theta)
    y = r * np.sin(theta)

    return x, y


# Generate a random point on a hemisphere using power cosine
def random_cosine(u, v, m=1):
    theta = np.arccos(np.power(1 - u, 1 / (1 + m)))
    phi = 2 * np.pi * v

    # Switch to cartesian coordinates
    x = np.sin(theta) * np.cos(phi)
    y = np.sin(theta) * np.sin(phi)

    return x, y


# Generate a random point on a hemisphere using power cosine (uniform)
def random_uniform_cosine(u, v):
    sintheta = np.sqrt(-u*(u-2))
    phi = 2 * np.pi * v

    # Switch to cartesian coordinates
    x = sintheta * np.cos(phi)
    y = sintheta * np.sin(phi)

    return x, y