

* [Stanford CS229 on YouTube](https://www.youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU)
* [Material on Github](https://github.com/maxim5/cs229-2018-autumn)


[Python Tutorial](./cs229-2018-autumn/section/cs229_python_tutorial/cs229_python_friday.pdf)


☐ [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf)

☑ [Lecture 1](https://www.youtube.com/watch?v=jGwO_UgTS7I&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=1&t=1279s)

☐ [Problem Set 0](./cs229-2018-autumn/problem-sets/PS0/ps0.pdf)

☑ [Lecture 2](https://www.youtube.com/watch?v=4b4MUYve_U8&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=2)

☐ [Discussion Section: Linear Algebra](./cs229-2018-autumn/section/cs229-linalg.pdf)

☐ [Lecture 3](https://www.youtube.com/watch?v=het9HFqo1TQ&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=3)

Lecture 4

☐ [Problem Set 1](./cs229-2018-autumn/problem-sets/PS1/ps1.pdf)




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

☑ [Lecture 2](https://www.youtube.com/watch?v=4b4MUYve_U8&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=2)

* Training Set -> Learning Algorithm -> Hypothesis, h(x)
* How to represent $h(x)$?
* Linear regression, $h(x) = θ_0 + θ_1 \cdot x$
* x1 = size, x2 = No. of bedrooms
* $\theta$: parameters
* $m$: No. of training examples, index $i$
* $x$: inputs/features, size(x) = (m,n)
* $y$: outputs/target variables, size(y) = m
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
    s = 0.0
    for i in 1:m # examples
        s += (y[i] - x[i:i,:]*θ)*x[i,j]
    end
    θ[j] = θ[j] + ⍺ * s
end

# zero index will be a problem in Julia
h(i,j) = θ0 + θ1*x[i,j]
for j in 1:n # parameters
    s = 0.0
    for i in 1:m # examples
        s += (y[i] - h(i,j))*x[i,j]
    end
    θ[j] = θ[j] + ⍺ * s
end



h = x * θ
#   n   1  nxm    m   m
θ = θ + ⍺ * x' * (y - h)


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

### Matrix derivatives

### Least squares revisited
* design matrix, $X$
* normal equation
* from equation (5), let $B= I$, $\nabla_A tr A A^T C = CA + C^TA$
* pseudo inverse



☐ [Discussion Section: Linear Algebra](./cs229-2018-autumn/section/cs229-linalg.pdf)

☐ [Lecture 3](https://www.youtube.com/watch?v=het9HFqo1TQ&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=3)


* Outline
    * Linear regression
    * Locally weighted regression
    * Probabilistic interpretation
    * Logistic regression
    * Newton's method

* $(x^(i),y^(i))$ ith example
* $x^{(i)} \in \R^{n+1}, x_0 = 1$, $y^{(i)} \in \R$
* m = # example, n = # features
* $h_\theta(x) = \sum_{j=0}^n \theta_j x_j = \theta^Tx$
* $J(\theta) = \frac{1}{2}\sum_{i=1}^{m}(h_\theta(x^{(i)}) - y^{(i)})^2$




## Locally weighted linear regression
[Lecture 3](https://www.youtube.com/watch?v=het9HFqo1TQ&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=3)

* Parametric learning algorithm
  * Fit fixed set of parameters, $\theta_i$, to data
* Non-parametric learning algorithm
  * Amount of data/parameters need to keep grows linearly with the size of the data


21:56

## Probabilistic interpretation
[Lecture 3](https://www.youtube.com/watch?v=het9HFqo1TQ&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=3)

Time: 21:56

* Why least square error?

22:35



# Classification and logistic regression

## Logistic regression

## Digression: The perceptron learning algorithm

## Another algorithm for maximizing $l(\theta)$

# Generalized Linear Models

## The exponential family

## Constructing GLMs

See the [syllabus](./cs229-2018-autumn/syllabus-autumn2018.html) for the timing of problem sets

[Problem Set 0](./cs229-2018-autumn/problem-sets/PS0/ps0.pdf)



Margin

Margin

Margin

Margin

Margin

Margin

Margin

Margin

Margin
