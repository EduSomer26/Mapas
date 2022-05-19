using DynamicalSystems, CairoMakie

r = 0.8:0.0005:1.3
spectrum = rand(length(r),2)
ds = Systems.henon()

for (i , a) in enumerate(r)
    set_parameter!(ds, 1, a)
    spectrum[i,:] .= lyapunovspectrum(ds, 1000; Ttr = 500)
end

fig = Figure(resolution = (1920,1080))
ax = Axis(fig[1,1]; xlabel = L"a", ylabel = L"\lambda")
for j in 1:1
    lines!(ax, r, spectrum[:, j];markersize = 0.8,color=("black"))
end
fig
