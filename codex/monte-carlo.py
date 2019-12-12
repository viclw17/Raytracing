import matplotlib.pyplot as plt
import math, random

##########
# return a new function, dg/dx
# def derivative(g):
#     delta = 1e-10
#     return lambda x : (g(x+delta)-g(x-delta)) / (2*delta)

# # g(x) = x^3
# def g(x):
#     return x**3

# # g'(x) = 3x^2
# dg = derivative(g)

# print (dg(2))

##########
def deterministicEstimateIntegral(g, low, high):
    N = 50
    sum = 0
    dx = (high-low)/N
    sampleLocations = [ low+(i+0.5)*dx for i in range(0,N)]
    print (sampleLocations)

    for x in sampleLocations:
        sum += g(x)*dx
    
    print ([g(i) for i in sampleLocations])
    plt.bar(sampleLocations, [g(i) for i in sampleLocations], width=dx, align='center', edgecolor='w')                   
    plt.axis([low, high, 0, 5])
    plt.show()

    return sum

def g(x): return x*x
print (deterministicEstimateIntegral(g, 1, 2))

# broken case
# def h(x): return -math.cos(x*2*math.pi)
# print(deterministicEstimateIntergral(h, 0, 100))

# plot
# x = list(range(0,1000))
# x = [float(i)/100 for i in x]
# plt.plot(x, [h(i) for i in x])
# plt.axis([0, 5, -2, 2])
# plt.show()

##########
def monteCarloEstimateIntegral(g, sample, A, N):
    I = 0;
    for j in range(0,N):
        (m,pm) = sample(A)
        I += g(m)/(pm*N)
    return I

# return a tuple
def uniformSample(A):
    return (random.uniform(A[0],A[1]), 1/(A[1]-A[0])) # (m, pm)
    # m - the sample taken from the distribution
    # pm - the value of the pdf at m
    # https://en.wikipedia.org/wiki/Uniform_distribution_(continuous)#Probability_density_function


# def h(x): return -math.cos(x*2*math.pi)
# print(monteCarloEstimateIntegral(h, uniformSample, (0, 100), 100))

