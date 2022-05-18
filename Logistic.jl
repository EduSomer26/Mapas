using DynamicalSystems, CairoMakie

ds = Systems.logistic()
i = 1
pvalues = 1:0.0005:4
ics = [rand() for m in 1:10]
n = 2000
Ttr = 2000
p_index = 1
output = orbitdiagram(ds, i, p_index, pvalues; n = n, Ttr = Ttr)

L = length(pvalues)
x = Vector{Float64}(undef, n*L)
y = copy(x)
for j in 1:L
    x[(1 + (j-1)*n):j*n] .= pvalues[j]
    y[(1 + (j-1)*n):j*n] .= output[j]
end

fig = CairoMakie.Figure(resolution = (1920,1080))
fig, ax = CairoMakie.scatter(x, y; axis = (xlabel = L"a", ylabel = L"x"),
    markersize = 0.2, color = ("black", 0.5),
)
CairoMakie.xlims!(ax, pvalues[1], pvalues[end]); CairoMakie.ylims!(ax,0,1)
fig
