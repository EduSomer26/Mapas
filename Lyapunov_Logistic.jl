using DynamicalSystems

parametro = 3.6

ds = Systems.logistic(r = parametro)

print(lyapunovspectrum(ds, 10000))
