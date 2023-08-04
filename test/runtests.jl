using Test
using .Mathematical_pendulum_using_the_Runge_Kutta_method

g = 9.80665 # gravitational acceleration for Earth

# Test 1: Harmonic Oscillator Function
@testset "Test 1: Harmonic Oscillator Function" begin
    l, t, theta0, dtheta0 = 1, 1, 0.1, 0
    result = harmonic_oscillator(l, t, theta0, dtheta0, g)
    expected = theta0 * cos(sqrt(g/l) * t)
    @test result ≈ expected
end

# Test 2: Energy Function
@testset "Test 2: Energy Function" begin
    l, theta, dtheta = 1, 0.1, 0.5
    result = energy(l, theta, dtheta,g)
    expected = 0.5 * l^2 * dtheta^2 + g * l * (1 - cos(theta))
    @test result ≈ expected
end

# Test 3: Derivatives Function
@testset "Test 3: Derivatives Function" begin
    y, l = [0.1, 0.5], 1
    result = derivatives(y, l,g)
    expected = [0.5, -g/l * sin(0.1)]
    @test result ≈ expected
end

# Test 4: Nihalo (Runge-Kutta method) Function
@testset "Test 4: Nihalo (Runge-Kutta method) Function" begin
    l, t, theta0, dtheta0, n = 1, 2, 0.1, 0.5, 100
    result = nihalo(l, t, theta0, dtheta0, n, g)
    @test length(result) == n
    @test result[1] == theta0
end

# Test 5: Period Function
@testset "Test 5: Period Function" begin
    l, t, theta0, dtheta0, n = 1, 10, 0.1, 0, 1000
    result = period(l, t, theta0, dtheta0, n)
    theta_vals = nihalo(l, t, theta0, dtheta0, n, g)
    h = t / n
    t_half_period = argmin(abs.(theta_vals .- theta0)) * h
    expected = 2 * t_half_period
    @test result ≈ expected
end

