using Documenter
using mathematical_pendulum_using_the_Runge_Kutta_method

makedocs(
    sitename = "mathematical_pendulum_using_the_Runge_Kutta_method",
    format = Documenter.HTML(),
    modules = [mathematical_pendulum_using_the_Runge_Kutta_method]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
