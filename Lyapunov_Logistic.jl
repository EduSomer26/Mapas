using DynamicalSystems

l = 0.3 #substituir os parâmetros que queremos analisar
println("λ = coeficiente de Lyapunov")
L= LinRange(1.0, 1.6, 16)
j= 1 
for m in L
    λ = lyapunov(Systems.henon(a = m, b = l), 10000, d0 = 1e-7, upper_threshold = 1e-4, Ttr = 100)
    print(j,"λ para a= ",m," e b= ",l, " é: ", λ,"\n")
    j= j+1
end
