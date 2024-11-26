"""
Learn Plots
"""
module LearnPlots
using Plots
using Polynomials

## Backends
# gr()      # fast
# plotly()  # good for interaction

function learn_plots_1() # Polynomial
    gr()
    pt = plot(title="Learn how to plot", size=(600,600))
    f = Polynomial([0,0,1])
    plot!(pt, f, -2, 2)

    gui(pt)
end

function learn_plots_2() # Surface
    gr(); #plotly();
    # https://docs.juliaplots.org/stable/backends/#Fine-tuning
    x = range(-3, 3, length=30)
    pt = surface(
    x, x, (x, y)->exp(-x^2 - y^2), c=:viridis, legend=:none,
    nx=50, ny=50, display_option=Plots.GR.OPTION_SHADED_MESH,  # <-- series[:extra_kwargs]
    )

    gui(pt) # display
end



end