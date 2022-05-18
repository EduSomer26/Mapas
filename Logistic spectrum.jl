using DynamicalSystems, CairoMakie

r = 0:0.0005:4
lambda = zeros(length(r))

p = 0
for param in r:
        ds = Systems.logistic(param)
        for p in lambda:
                
