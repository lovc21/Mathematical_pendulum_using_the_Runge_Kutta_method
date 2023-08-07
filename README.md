# Mathematical pendulum using the Runge Kutta method

[![Documenter](https://github.com/lovc21/Mathematical_pendulum_using_the_Runge_Kutta_method.jl/actions/workflows/Documenter.yml/badge.svg)](https://github.com/lovc21/Mathematical_pendulum_using_the_Runge_Kutta_method.jl/actions/workflows/Documenter.yml)
[![Runtests](https://github.com/lovc21/Mathematical_pendulum_using_the_Runge_Kutta_method.jl/actions/workflows/Runtests.yml/badge.svg)](https://github.com/lovc21/Mathematical_pendulum_using_the_Runge_Kutta_method.jl/actions/workflows/Runtests.yml)

In this repository, you can fined the code for Homework 4 of the Numerical Methods course.The code is written in Julia, and the main implementation can be found in the file `src/Mathematical_pendulum_using_the_Runge_Kutta_method.jl`. The code is tested using the file `test/runtests.jl`, and it is documented using the file docs/make.jl, you can test the code for the specific by running the `Scripts/script.jl` file.

To run the code, it is necessary to have Julia installed on your computer. Once downloaded, you can run the Scripts/script.jl file to see the results of the code. The results are in a forme of 3 grafs. First graf shows the "Displacement of a Pendulum over Time" the second graf shows the "Displacement of a Harmonic Oscillator over Time" and the last graf shows "Period of a Pendulum as a Function of Energy".

The point of the task is to understand the Runge-Kutta method and to use it to solve the mathematical pendulum problem. The mathematical pendulum is a pendulum that is not affected by friction. On the image below, you can see the mathematical pendulum.

<p align="center">
  <img width="460" height="300" src="./images/Oscillating_pendulum.gif">
</p>

The code and the working of the Pendulum is documented using Documenter.jl. To see the documentation, you can run the `docs/make.jl` file. The documentation is also available online at [documentation](https://lovc21.github.io/Mathematical_pendulum_using_the_Runge_Kutta_method.jl/dev/).


---
TLDR the documentation. 
Here are the results of the code: 
<img title="Displacement of a Pendulum over Time" alt="Alt text" src=".\images\Displacement of a Pendulum over Time.JPG">
<img title="Displacement of a Harmonic Oscillator over Time" alt="Alt text" src=".\images\Displacement of a Harmonic Oscillator over Time.JPG">
<img title="Period of a Pendulum as a Function of Energy" alt="Alt text" src=".\images\Period of a Pendulum as a Function of Energy.JPG">
