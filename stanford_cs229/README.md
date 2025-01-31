# My CS229

> [Syllabus](./cs229-2018-autumn/syllabus-autumn2018.html)  
> [Stanford CS229 on YouTube](https://youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&si=kS07gMKIi_NB2Rlm)  
> [Handouts on Github](https://github.com/maxim5/cs229-2018-autumn)  
> [Python Tutorial](./cs229-2018-autumn/section/cs229_python_tutorial/cs229_python_friday.pdf)  
> [ml-yearning book](https://github.com/yennlh/ml-yearning)  


☐ [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf)

☑ [Lecture 1](https://www.youtube.com/watch?v=jGwO_UgTS7I&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=1&t=1279s)

☐ [Problem Set 0](./cs229-2018-autumn/problem-sets/PS0/ps0.pdf), due on Lecture 4?

☑ [Lecture 2](https://www.youtube.com/watch?v=4b4MUYve_U8&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=2)

☐ [Discussion Section: Linear Algebra](./cs229-2018-autumn/section/cs229-linalg.pdf)

☐ [Lecture 3](https://www.youtube.com/watch?v=het9HFqo1TQ&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=3)

Lecture 4

☐ [Problem Set 1](./cs229-2018-autumn/problem-sets/PS1/ps1.pdf), due on Lecture 8



> [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf)  
> [Lecture 1](https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr)  
> [ml-yearning book](https://github.com/yennlh/ml-yearning)  



# [Lecture 1](https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr)
* 2018-09-24
* `https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr`
* Lecture starts at 36:20 


# [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf)
* `cs229-2018-autumn/notes/cs229-notes1.pdf`
* Supervised learning

---

CS229a is more applied (on Coursera?)  
CS229 most mathematical   
CS230 deep learning  


# Supervised Learning
* [Lecture 1@39:34](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2374)
* [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1

See the `housing price` example in the note.  

Training set, $\{(x^{(i)}, y^{(i)}); i = 1, \ldots, m\}$  
Input,  $x$  
Output, $y$   
A hypothesis, $h: \mathcal{X} \mapsto \mathcal{Y}$  

Continuous, regression problem  
Discrete,   classification problem  

**5 topics**
* Supervised learning, [Lecture 1@39:34](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2374)
* Machine learning strategy, [Lecture 1@58:19](https://youtu.be/jGwO_UgTS7I?si=Zp7HmdCk4g7Ul6Pd&t=3499)
* Deep learning, [Lecture 1@1:04:06](https://youtu.be/jGwO_UgTS7I?si=MiGzHLya5JawEoyb&t=3846)
* Unsupervised learning, [Lecture 1@1:04:55](https://youtu.be/jGwO_UgTS7I?si=KzVPsuc5X0GrUjk7&t=3895)
* Reinforcement learning, [Lecture 1@1:11:18](https://youtu.be/jGwO_UgTS7I?si=7al9kavU1hUy5g9I&t=4278)

# [Lecture 2](https://youtu.be/4b4MUYve_U8?si=fWcooAh8yaYWXHPA)
* 2018-09-26

# Supervised Learning
* [Lecture 2@3:01](https://youtu.be/4b4MUYve_U8?si=RrWTO1ZCVGdTQ4VC&t=181)
* [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1

[Lecture 2@2:39](https://youtu.be/4b4MUYve_U8?si=x9f1zW1no4TAYxAl&t=159)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1  
Example  

[Lecture 2@3:12](https://youtu.be/4b4MUYve_U8?si=muE-BHqu9gcAF3Qo&t=192)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 2  
Diagram  

Training set, $\{(x^{(i)}, y^{(i)}); i = 1, \ldots, m\}$  
Input,  $x$  
Output, $y$   
A hypothesis, $h: \mathcal{X} \mapsto \mathcal{Y}$  

Continuous, regression problem  
Discrete,   classification problem  

# Linear Regression
* [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 3

[Lecture 2@4:51](https://youtu.be/4b4MUYve_U8?si=kOpmyaQ-pbVZWoUD&t=291)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 3  
How to represent $h(x)$?  
Linear regression, $h(x) = \theta_0 + \theta_1x_1 + \theta_2x_2$  

[Lecture 2@7:54](https://youtu.be/4b4MUYve_U8?si=g7HG_okUwJNCbb0V&t=474)  
$h(x) = \sum_{j=0}^2 \theta_jx_j$ where $x_0=1$  

$x_1$, size  
$x_2$, No. of bedrooms  
$\theta$, parameters  

$m$: No. of training examples, index $i$  
$n$: No. of features, index $j$  
$x$: inputs/features, size(x) = (m,n)  
$y$: outputs/target variables, size(y) = m  
$\theta_j$, $j^\text{th}$ parameter, $\text{size}(\theta) = n$  
$(x,y)$: training example, $(x^{(i)},y^{(i)})$: $i^\text{th}$ training example  

$h(\bm{x}) = \sum_{j=0}^n \theta_jx_j = \bm{\theta}^T\bm{x}$ where $x_0=1$  

[Lecture 2@12:50](https://youtu.be/4b4MUYve_U8?si=4-Wq6xCgYbF6-sYb&t=770)  
Note $h(\bm{x})$ somethime is written as $h_\theta(\bm{x})$ to emphasize parameters $\theta$.  

Choose $\bm{\theta}$ such that $h_\theta(\bm{x}) \approx y$ for training example.  
Minimize the cost function
$$
\begin{align*}
J(\bm\theta) &= \frac{1}{2}\sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)})^2 \\
             &= \frac{1}{2}\sum_{i=1}^{m}(\theta_0 + \theta_1x_1^{(i)} + \theta_2x_2^{(i)} + \ldots+ \theta_nx_n^{(i)} - y^{(i)})^2  \\
\end{align*}
$$

> My understanding
> $$
> \begin{align*}
> J(\bm\theta) &= \frac{1}{2} \| \bm{X}\bm\theta - \bm{y}\|_2^2 \\
> \end{align*}
> $$

[Lecture 2@16:10](https://youtu.be/4b4MUYve_U8?si=4-Wq6xCgYbF6-sYb&t=970)  


[Lecture 2@18:13](https://youtu.be/4b4MUYve_U8?si=3NGQOHHU1xN6yAxp&t=1093)  
Gradient descent  
Initial guess $\bm\theta = \vec{0}$  
Keep change $\bm\theta$ to reduce $J(\bm\theta)$  
3D plot, [Lecture 2@19:58](https://youtu.be/4b4MUYve_U8?si=3NGQOHHU1xN6yAxp&t=1198)  
Gradient descent (in the steepest direction)  
Step of gradient descent

[Lecture 2@23:54](https://youtu.be/4b4MUYve_U8?si=3NGQOHHU1xN6yAxp&t=1434)  

## LMS algorithm
* [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 4  
* Least mean squares

$$
\theta_j := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\theta)
$$

where    $j = 0,1 \ldots ,n$,    $\alpha$ is the learning rate.  

26:04

Set $\alpha = 0.01$ in practice.

27:33

---

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





## Probabilistic interpretation
* [Lecture 3](https://youtu.be/het9HFqo1TQ?si=sUg0Q37jlcdvrjyN), Time: 21:56
* Why least square error?
* Normal distribution in terms of $\theta$, Time: 29:15
* Central limit theorem, Time: 35:56
* Maximum likelihood estimation, Time: 41:03




# Classification and logistic regression
* [Lecture 3](https://youtu.be/het9HFqo1TQ?si=sUg0Q37jlcdvrjyN), Time: 43:36
Time: 45:58


## Logistic regression
* [Lecture 3](https://youtu.be/het9HFqo1TQ?si=sUg0Q37jlcdvrjyN), Time: 46:35
* Want $h_\theta(x) \in [0,1]$
* Batch gradient descent, Time: 1:02:09

$$
\theta_j := \theta_j + \alpha \sum_{i=1}^m (y^{(i)} - h_\theta(x^{(i)})) x_j^{(i)}
$$

## Another algorithm for maximizing $l(\theta)$
* [Lecture 3](https://youtu.be/het9HFqo1TQ?si=sUg0Q37jlcdvrjyN)
* Newton's method, 1:05:31


## Digression: The perceptron learning algorithm

# Generalized Linear Models
* [Lecture 4](https://youtu.be/iZTeva0WSTQ?si=adSzsWr66pQLrJa0)

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
