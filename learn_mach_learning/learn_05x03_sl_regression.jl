# ML > SL > Classification > Logistic Regression

using Plots
using CSV

gr(size=(800,600))

# plot logistic curve, Time: 8:28
logistic(x) = 1/(1+exp(-x))

# plot logistic function
p_logistic = plot(-6:0.1:6, logistic; color=:steelblue4, linewidth=3,
    xlabel="Inputs (x)", ylabel="Outputs (x)", legend=false,
    title="Logistic (Sigmoid) Curve")

# modify logistic curve, Time: 10:37
# initialize parameters

theta_0 = 0.0    # y-intercept, default=0, try 1, -1
theta_1 = 1.0    # slope, default=1, try 0.5, -0.5
# hypothesis function
z(x) = theta_0 .+ theta_1*x
#h(x) = 1 ./ (1 .+ exp.(-z(x)))
h(x) = @. 1/(1 + exp(-z(x)))

# re-plot
#plot!(p_logistic, h; color=:firebrick1, linestyle=:dash)

theta_0 = 1.0    # y-intercept, default=0, try 1, -1
theta_1 = 1.0    # slope, default=1, try 0.5, -0.5

#plot!(p_logistic, h; color=:firebrick1, linestyle=:dash)

theta_0 = -1.0    # y-intercept, default=0, try 1, -1
theta_1 = 1.0    # slope, default=1, try 0.5, -0.5
#plot!(p_logistic, h; color=:firebrick1, linestyle=:dash)

theta_0 = 0.0    # y-intercept, default=0, try 1, -1
theta_1 = 0.5    # slope, default=1, try 0.5, -0.5
#plot!(p_logistic, h; color=:firebrick1, linestyle=:dash)

theta_0 = 0.0    # y-intercept, default=0, try 1, -1
theta_1 = -0.5    # slope, default=1, try 0.5, -0.5
plot!(p_logistic, h; color=:firebrick1, linestyle=:dash)

# data set
# https://raw.githubusercontent.com/julia4ta/tutorials/master/Series%2005/Files/wolfspider.csv
data = CSV.File("wolfspider.csv")
X = data.feature
Y_temp = data.class
Y = [y == "present" ? 1.0 : 0.0 for y in Y_temp]

# Time: 17:49
p_data = scatter(X,Y; color=:firebrick2, markersize=5, legend=false,
    xlabel="Size of Grains of Sand (mm)", ylabel="Probability of Observation (Absent=0, Present=1)",
    title="Wolf Spider Presence Classifier" )

# Workflow, Time: 18:44
#     1. Initialize Parameters
#     2. Define Hypothesis Function
#     3. Define Cost Function
#     4. Define Optimization Algorithm
#     5. Initialize Hyperparameters
#     6. Change Parameters
#     7. Recalculate Cost
#     8. Iterate Until Convergence

# track parameter value history
t0_history = []
t1_history = []

# Logistic Regression Model, Time: 19:44
#     1. Initialize Parameters
theta_0 = 0.0; push!(t0_history, theta_0)
theta_1 = 1.0; push!(t1_history, theta_1)

# define hypothesis function
z(x) = @. theta_0 + theta_1 * x
h(x) = @. 1/(1+exp(-z(x)))

# plot initial hypothesis
plot!(p_data, 0:0.1:1.2, h; color=:olive)

# use cost function from Andrew Ng, Time: 22:24
m = length(X)
y_hat = h(X)
function cost()
    (-1/m) * sum(Y .* log.(y_hat) + (1 .- Y) .* log.(1 .- y_hat)  )
end

J = cost()

# track cost value history
J_history = Float64[]
push!(J_history, J)

# define batch gradient descent algorithm

# use partial derivative formula from Andrew Ng
# Why the partial derivate looks like last example?
function pd_theta_0()
    sum(y_hat - Y)
end
function pd_theta_1()
    sum((y_hat - Y) .* X)
end
# set learning rate
alpha = 0.01
# initialize epochs
epochs = 0
###################
# begin iterations
###################
for i in 1:5000
    # calculate partial derivatives
    theta_0_temp = pd_theta_0()
    theta_1_temp = pd_theta_1()
    # adjust parameters by the learning rate
    theta_0 = theta_0 - alpha*theta_0_temp
    theta_1 = theta_1 - alpha*theta_1_temp

    push!(t0_history, theta_0)
    push!(t1_history, theta_1)

    # recalculate cost
    y_hat = h(X)
    J = cost()
    push!(J_history, J)
    # replot prediction
    epochs += 1

    plot!(p_data, 0:0.1:1.2, h; color=:steelblue4, alpha=0.025,
        title="Wolf Spider Presence Classifier (epochs=$(epochs))")
end
p_data

# plot learning curve
p_l_curve = plot(0:epochs, J_history; color=:steelblue3, linewidth=2, legend=false,
    xlabel="Epochs", ylabel="Cost", title="Learning Curve")

# plot parameters
p_params = scatter(t1_history, t0_history; color=:steelblue2, alpha=0.5, 
    markerstrokewidth=0, legend=false,
    xlabel="theta_1", ylabel="theta_0", title="Gradient Descent Path")

# make prediction
newX = 0.25:0.25:1.0
@show h(newX)