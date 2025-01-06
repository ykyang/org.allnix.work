# https://www.youtube.com/watch?v=n03pSsA7NtQ&list=PLhQ2JMBcfAsi76O13sJzk4LXA_mu5sd9E&index=2&t=146s
using CSV, GLM, Plots, TypedTables

data = CSV.File("housingdata.csv")

X = data.size
Y = round.(Int, data.price/1000)
t = Table(X=X, Y=Y)                # Time: 6:45

gr(size=(800,800))

p_scatter = scatter(X, Y; xlims=(0,5000), ylims=(0,800),
    xlabel="Size (sqft)", ylabel="Price (\$1000)", title="Housing Prices in Portland",
    legend=false, color=:red)

ols = GLM.lm(@formula(Y ~ X), t) # Ordinary Least Squares
    """
    Coefficients:
    ──────────────────────────────────────────────────────────────────────────
                     Coef.  Std. Error      t  Pr(>|t|)  Lower 95%   Upper 95%
    ──────────────────────────────────────────────────────────────────────────
    (Intercept)  71.2898    26.1331      2.73    0.0091  18.655     123.925
    X             0.134533   0.0121571  11.07    <1e-13   0.110047    0.159018
    ──────────────────────────────────────────────────────────────────────────
    """
#

# predict(ols) new Y from the formula
plot!(p_scatter, X, predict(ols); color=:green, linewidth=3)

# predict price
newX = Table(X=[1250])
predict(ols, newX) # [ 239.4556726896737]

# Time: 10:30
