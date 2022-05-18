using DynamicalSystems, CairoMakie

r = 1:0.0005:4.0
spectrum = rand(length(r),2)
ds = Systems.logistic()

for (i , a) in enumerate(r)
    set_parameter!(ds, 1, a)
    spectrum[i,:] .= lyapunovspectrum(ds, 1000; Ttr = 500)
end

fig = Figure(resolution = (1920,1080))
ax = Axis(fig[1,1]; xlabel = L"r", ylabel = L"\lambda")
for j in 1:2
    lines!(ax, r, spectrum[:, j];markersize = 0.8,color=("black"))
end
fig
save("LyapunovSpectrumLogistic.png", fig)
