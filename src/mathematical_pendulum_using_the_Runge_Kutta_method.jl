module mathematical_pendulum_using_the_Runge_Kutta_method

using Plots
using LinearAlgebra

export runge_kutta, pendulum_system, harmonic_oscillator, energy, period

function runge_kutta(h, x, y, f)
    k1 = h * f(x, y)
    k2 = h * f(x + h/2, y + k1/2)
    k3 = h * f(x + h/2, y + k2/2)
    k4 = h * f(x + h, y + k3)
    y_next = y + (k1 + 2*k2 + 2*k3 + k4) / 6
    return y_next
end

function pendulum_system(l, t, theta0, dtheta0, n)
    g = 9.80665  # acceleration due to gravity in m/s^2
    h = t / n  # step size

    # System of equations
    f(x, y) = [y[2], -g/l * sin(y[1])]

    # Initial conditions
    y = [theta0, dtheta0]

    # Time array
    t_array = range(0, stop=t, length=n+1)
    
    # Solution array
    theta_array = zeros(n+1)
    theta_array[1] = theta0

    for i in 1:n
        y = runge_kutta(h, t_array[i], y, f)
        theta_array[i+1] = y[1]
    end
    
    return theta_array
end

function harmonic_oscillator(l, t, theta0, dtheta0)
    g = 9.80665  # acceleration due to gravity in m/s^2
    return theta0 * cos(sqrt(g/l) * t) + dtheta0/sqrt(g/l) * sin(sqrt(g/l) * t)
end

function energy(l, theta, dtheta)
    g = 9.80665  # acceleration due to gravity in m/s^2
    return 0.5 * l^2 * dtheta^2 + g * l * (1 - cos(theta))
end

function period(l, t, theta0, dtheta0, n)
    theta = pendulum_system(l, t, theta0, dtheta0, n)
    h = t / n  # time step
    t_half_period = argmin(abs.(theta .- theta0)) * h
    return 2 * t_half_period
end


l = 1
t = 10
theta0 = 0.1
dtheta0 = 0
n = 1000

theta = pendulum_system(l, t, theta0, dtheta0, n)

t_array = range(0, stop=t, length=n+1)
theta_harmonic = harmonic_oscillator.(l, t_array, theta0, dtheta0)

plot(t_array, theta, label="Pendulum")
plot!(t_array, theta_harmonic, label="Harmonic Oscillator")
xlabel!("Time (s)")
ylabel!("Displacement (rad)")
title!("Displacement of a Pendulum vs a Harmonic Oscillator over Time")

dtheta0_array = range(0, stop=3, length=100)

periods = [period(l, t, theta0, dtheta0, n) for dtheta0 in dtheta0_array]
energies = [energy(l, theta0, dtheta0) for dtheta0 in dtheta0_array]

plot(energies, periods, seriestype=:scatter)
xlabel!("Energy")
ylabel!("Period (s)")
title!("Period of a Pendulum as a Function of Energy")

end # module mathematical_pendulum_using_the_Runge_Kutta_method
