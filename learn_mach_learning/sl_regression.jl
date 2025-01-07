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

# Time: 6:25

## Non-machine Learning Approach
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

# Time: 10:50

## Machine learning approach
epochs = 0

p_scatter = scatter(X, Y; xlims=(0,5000), ylims=(0,800),
    xlabel="Size (sqft)", ylabel="Price (\$1000)",
    title="Housing Prices in Portland (epochs = $(epochs))",
    legend=false, color=:red)

# initialize parameters
theta_0 = 0.0 # y-intercept
theta_1 = 0.0 # slope

# Time: 13:27

# define linear regression model
h(x) = theta_0 .+ theta_1 * x
# add linear regression line to plot
plot!(p_scatter, X, h(X); color=:blue, linewidth=3)

# Time: 16:09

# use cost function from Andrew Ng
m = length(X)
y_hat = h(X)
function cost(X,Y)
    (1/(2*m)) * sum((y_hat - Y) .^2)
end
J = cost(X,Y)

# Time: 17:24

# push cost value into vector
J_history = []

push!(J_history, J)

# batch gradient descent algorithm
# define batch gradient descent algorithm
# use partial derivate formula from Andrew Ng

function pd_theta_0(X,Y)
    (1/m) * sum(y_hat - Y)
end
function pd_theta_1(X,Y)
    (1/m) * sum((y_hat - Y) .* X)
end
# set learning rate (alpha), hyperparameter
alpha_0 = 0.09
alpha_1 = 8e-8
# begin iterations (repeat until convergence)
# calculate partial derivatives
# theta_0_temp = pd_theta_0(X,Y)
# theta_1_temp = pd_theta_1(X,Y)
# adjust parameters by the learning rate
# theta_0 = theta_0 - alpha_0 * theta_0_temp
# theta_1 = theta_1 - alpha_1 * theta_1_temp
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)

# Time: 23:37

# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #
theta_0 = theta_0 - alpha_0 * pd_theta_0(X,Y)
theta_1 = theta_1 - alpha_1 * pd_theta_1(X,Y)

# recalculate cost
y_hat = h(X)
J = cost(X,Y)

push!(J_history, J)

# replot prediction
epochs += 1
plot!(p_scatter, X, y_hat; color=:blue, alpha=0.5,
    title = "Housing Prices in Portland (epochs = $(epochs))"
)
# -------------------------------------------- #

plot!(p_scatter, X, predict(ols); color=:green, linewidth=3)

# plot learning curve
gr(size=(800,800))
p_line = plot(0:epochs, J_history, xlabel="Epochs", ylabel="Cost",
    title="Learning Curve", legend=false, color=:blue, linewidth=2
)

# predict price based on a new value for size
newX_ml = [1250]
@show h(newX_ml)


# check ml prediction against non-ml prediction (GLM)
@show predict(ols, newX)