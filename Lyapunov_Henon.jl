using DynamicalSystems

l = 0.3 #substituir o parâmetro "b" da equação
println("λ = coeficiente de Lyapunov")

L= LinRange(1.0, 1.6, 16) #Aqui será o range que o parâmetro "a" terá, indo de 1 até 1.6

for m in L
    λ = lyapunov(Systems.henon(a = m, b = l), 10000, d0 = 1e-7, upper_threshold = 1e-4, Ttr = 100) #valores definidos para o cálculo do expoente
    print("λ para a= ",m," e b= ",l, " é: ", λ,"\n")
end
