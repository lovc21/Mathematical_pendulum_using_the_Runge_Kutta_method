using Plots
using .Mathematical_pendulum_using_the_Runge_Kutta_method

g = 9.80665 # gravitational acceleration for Earth

l = 1 # length of the pendulum
t = 10 # time
n = 1000 # number of time steps
theta0 = deg2rad(30) # initial angle
dtheta0 = deg2rad(1) # initial angular velocity

times = range(0, stop=t, length=n)
displacement = nihalo(l, t, theta0, 1dtheta0, n, g)

plot(times, displacement, xlabel="Time (s)", ylabel="Displacement (rad)", label="Pendulum")
title!("Displacement of a Pendulum over Time")

t_array = range(0, stop=t, length=n+1)
harmonic_displacement = harmonic_oscillator.(l, t_array, theta0, dtheta0,g)

plot(t_array, harmonic_displacement,xlabel = "Time (s)", ylabel="Displacement (rad)" , label="Harmonic Oscillator")
title!("Displacement of a Harmonic Oscillator over Time")

dtheta0_array = range(0, stop=3, length=100)

periods = [period(l, t, theta0, dtheta, n,g) for dtheta in dtheta0_array]
energies = [energy(l, theta0, dtheta,g) for dtheta in dtheta0_array]

plot(energies, periods, seriestype=:scatter)
xlabel!("Energy")
ylabel!("Period (s)")
title!("Period of a Pendulum as a Function of Energy")


step_sizes = [100, 500, 1000, 2000]
results = []

for n in step_sizes
    displacement = nihalo(l, t, theta0, dtheta0, n, g)
    push!(results, displacement)
end

# Plot the results
for (i, result) in enumerate(results)
    plot(times[1:length(result)], result, label="Step size = $(step_sizes[i])")
end