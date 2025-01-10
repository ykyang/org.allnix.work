

* [Stanford CS229 on YouTube](https://www.youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU)
* [Material on Github](https://github.com/maxim5/cs229-2018-autumn)

# Linear Regression

* `cs229-notes1.pdf`
* [Lecture 1](https://www.youtube.com/watch?v=jGwO_UgTS7I&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=1&t=1279s)
* [ml-yearning book](https://github.com/yennlh/ml-yearning)

```default
CS229a is more applied (on Coursera?)
CS229 most mathematical 
CS230 deep learning

Lecture starts at 36:20

Supervised Learning
h: X -> Y
h is hypothesis
continuous, regression problem
discrete,   classification problem

5 topics
Supervised learning
Machine learning strategy
Deep learning
Unsupervised learning
Reinforcement learning
```

* [Lecture 2](https://www.youtube.com/watch?v=4b4MUYve_U8&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=2)

```default
Training Set -> Learning Algorithm -> Hypothesis (h(x))
How to represent h(x)?
Linear regression, h(x) = θ0 + θ1*x
x1 = size, x2 = No. of bedrooms
```

* $\theta$: parameters
* $m$: No. of training examples, index $i$
* $x$: inputs/features
* $y$: outputs/target variables
* $(x,y)$: training example
* $(x^{(i)},y^{(i)})$: $i^\text{th}$ training example
* $\theta_j$, $j^\text{th}$ parameter
* $n$: No. of features, index $j$
* Learning algorithm choose parameters, $\theta$, for the hypothesis, $h(x)$.
* Cost function
$$
J(\theta) = \frac{1}{2}\sum_{i=1}^{m}(h_\theta(x^{(i)}) - y^{(i)})^2
$$


## LMS algorithm
* gradient descent (in the steepest direction)
* Initial guess $\theta = \vec{0}$
* 3D plot at 19:58

<center> <img alt="Batch gradient descent" src="batch_gradient_descent.png" width="80%"/> </center>


```julia
# Repeat until convergence
# size(x) == (m,n)
# m >> n
# θ[n], x[m,n], y[m]
for j in 1:n # parameters
    θ[j] = θ[j] + ⍺ * sum(y .- h.(x[i,:])) * x[:,j]
    θ[j] = θ[j] + ⍺ * sum(y .- θ * )) * x[:,j]
end
h(xi) = θ .* xi
for j in 1:n # parameters
    s = 0.0
    for i in 1:m # examples
        s += (y[i] - θ .* x[i,:])*x[i,j]
    end
    θ[j] = θ[j] + ⍺ * s
end

```

* $\alpha$, learning rate
* LMS (least mean squares) update, Widrow-Hoff learning rule
* update proportional to the error, $y^{(i)} - h(x^{(i)})$
* batch gradient descent
* J is a convex quadratic function
* stochastic gradient descent, faster

<center> <img src="stochastic_gradient_descent.png" width="80%"/> </center>

```julia
for j in 1:n
    for i in 1:m
        θ[j] = θ[j] + ⍺ * (y[i] - h(x[i])) * x[j]
    end
end
```

## The normal equations



Time: 54:03