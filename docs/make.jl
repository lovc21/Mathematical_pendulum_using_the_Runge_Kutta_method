using Documenter
using Mathematical_pendulum_using_the_Runge_Kutta_method

makedocs(
    sitename = "Mathematical_pendulum_using_the_Runge_Kutta_method",
    format = Documenter.HTML(),
    modules = [Mathematical_pendulum_using_the_Runge_Kutta_method]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/lovc21/Mathematical_pendulum_using_the_Runge_Kutta_method.git",
    push_preview = true,
    devbranch = "main",
)
