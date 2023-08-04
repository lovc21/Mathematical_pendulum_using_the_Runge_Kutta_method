module Mathematical_pendulum_using_the_Runge_Kutta_method

using Plots
using LinearAlgebra

export harmonic_oscillator, energy, period, nihalo, derivatives

""" 
harmonic_oscillator calculates the displacement of a harmonic oscillator at a given time.
Parameters:
    l: length of the pendulum
    t: time
    theta0: initial angle
    dtheta0: initial angular velocity
    g: gravitational acceleration
Returns:
    The angulr displacement of the harmonic oscillator at time t.
"""
function harmonic_oscillator(l, t, theta0, dtheta0,g)
    return theta0 * cos(sqrt(g/l) * t) + dtheta0/sqrt(g/l) * sin(sqrt(g/l) * t)
end

"""
Calculates the total energy of the pendulum.
Parameters:
    l: length of the pendulum
    theta: angle
    dtheta: angular velocity
Returns:
    The total energy of the pendulum.
"""
function energy(l, theta, dtheta)
    return 0.5 * l^2 * dtheta^2 + g * l * (1 - cos(theta))
end

"""
Calculates the period of the pendulum.
Parameters:
    l: length of the pendulum
    t: time
    theta0: initial angle
    dtheta0: initial angular velocity
    n: number of time steps
Returns:    
    The period of the pendulum.
"""
function period(l, t, theta0, dtheta0, n)
    theta = nihalo(l, t, theta0, dtheta0, n, g)
    h = t / n  # time step
    t_half_period = argmin(abs.(theta .- theta0)) * h
    return 2 * t_half_period
end

"""
Calculates the derivatives of the system.
Parameters:
    y: vector of the angle and angular velocity
    l: length of the pendulum
Returns:
    A vector containing the derivatives of the angular displacement and velocity .
"""
function derivatives( y,l,g)
    theta, v = y
    return [v, -g/l * sin(theta)]
end
    
"""
Simulates the pendulum using the Runge-Kutta method.
Parameters:
    l: length of the pendulum
    t: time
    theta0: initial angle
    dtheta0: initial angular velocity
    n: number of time steps
    g: gravitational acceleration
Returns:
    A vector containing the angular displacement of the pendulum at each time step.	
"""
function nihalo(l, t, theta0, dtheta0, n,g)
    h = t / n  # step size

    y = [theta0, dtheta0]  # initial conditions
    theta_vals = [theta0]  # store the solution here

    for _ in 1:n-1  # loop over time steps
        k1 = h .* derivatives(y, l, g)
        k2 = h .* derivatives(y + 0.5 .* k1, l, g)
        k3 = h .* derivatives(y + 0.5 .* k2, l, g )
        k4 = h .* derivatives(y + k3, l,g)
        y += (k1 + 2 .* k2 + 2 .* k3 + k4) / 6.0
        push!(theta_vals, y[1])
    end 
    
    return theta_vals

end

end # module mathematical_pendulum_using_the_Runge_Kutta_method
