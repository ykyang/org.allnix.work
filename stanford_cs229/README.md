---
format:
  html:
    html-math-method: katex
#header-includes:
#  - \usepackage{algorithm}
#  - \usepackage{bm}
---

# My CS229
**Class material**
> [Syllabus](./cs229-2018-autumn/syllabus-autumn2018.html)  
> [Stanford CS229 on YouTube](https://youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&si=kS07gMKIi_NB2Rlm)  
> [Handouts on Github](https://github.com/maxim5/cs229-2018-autumn)  
> [Python Tutorial](./cs229-2018-autumn/section/cs229_python_tutorial/cs229_python_friday.pdf)  
> [ml-yearning book](https://github.com/yennlh/ml-yearning)  

**Class timeline**
> [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf)  
> [Lecture 1](https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr)  
> [Problem Set 0](./cs229-2018-autumn/problem-sets/PS0/ps0.pdf), due on Lecture 4?  
> [Discussion Section: Linear Algebra](./cs229-2018-autumn/section/cs229-linalg.pdf)
> [Problem Set 1](./cs229-2018-autumn/problem-sets/PS1/ps1.pdf), due on Lecture 8



# [Lecture 1](https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr)
* 2018-09-24
* https://youtu.be/jGwO_UgTS7I?si=WSwUyA5wdGubuhKr
* [Lecture 1 starts at @36:20](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2180)  


# [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf) Supervised Learning
* `cs229-2018-autumn/notes/cs229-notes1.pdf`

<details open="true">
<summary>Table of Content</summary>

* `Part I` Linear Regression
    * `1` LMS algorithm
    * `2` The normal equations
        * `2.1` Matrix derivatives
        * `2.2` Least squares revisited
    * `3` Probabilistic interpretation
    * `4` Locally weighted linear regression
* `Part II` Classification and Logistic Regression
    * `5` Logistic regression
    * `6` Digression: The perceptron learning algorithm
    * `7` Another algorithm for maximizing $l(\theta)$
* `Part III` Generalized Linear Models
    * `8` The exponential family
    * `9` Constructing GLMs
        * `9.1` Ordinary least squares
        * `9.2` Logistic regression
        * `9.3` Softmax Regression
</details>

---

[Lecture 1@35:20](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2120)  
CS229a is more applied (on Coursera?)  
CS229 most mathematical   
CS230 deep learning  

[Lecture 1@39:34](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2374)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1

# Supervised Learning
See the `housing price` example in [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1.

Training set, $\{(\bm x^{(i)}, y^{(i)}); i = 1, \ldots, m\}$  
Input,  $\bm x$  
Output, $y$   
Hypothesis, $h: \mathcal{X} \mapsto \mathcal{Y}$  

Continuous, regression problem  
Discrete,   classification problem  

---

**5 topics**

* Supervised learning, [Lecture 1@39:34](https://youtu.be/jGwO_UgTS7I?si=aOaDLuqM2u4Sp_Dj&t=2374)
* Machine learning strategy, [Lecture 1@58:19](https://youtu.be/jGwO_UgTS7I?si=Zp7HmdCk4g7Ul6Pd&t=3499)
* Deep learning, [Lecture 1@1:04:06](https://youtu.be/jGwO_UgTS7I?si=MiGzHLya5JawEoyb&t=3846)
* Unsupervised learning, [Lecture 1@1:04:55](https://youtu.be/jGwO_UgTS7I?si=KzVPsuc5X0GrUjk7&t=3895)
* Reinforcement learning, [Lecture 1@1:11:18](https://youtu.be/jGwO_UgTS7I?si=7al9kavU1hUy5g9I&t=4278)

# [Lecture 2](https://youtu.be/4b4MUYve_U8?si=fWcooAh8yaYWXHPA)
* 2018-09-26
* https://youtu.be/4b4MUYve_U8?si=fWcooAh8yaYWXHPA

---

[Lecture 2@2:39](https://youtu.be/4b4MUYve_U8?si=x9f1zW1no4TAYxAl&t=159)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1  
Example  

[Lecture 2@3:01](https://youtu.be/4b4MUYve_U8?si=RrWTO1ZCVGdTQ4VC&t=181)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 1  
Supervised learning

[Lecture 2@3:12](https://youtu.be/4b4MUYve_U8?si=muE-BHqu9gcAF3Qo&t=192)  
[Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 2  
Diagram  


Training set, $\{(x^{(i)}, y^{(i)}); i = 1, \ldots, m\}$  
Input,  $x$  
Output, $y$   
A hypothesis, $h: \mathcal{X} \mapsto \mathcal{Y}$  

Continuous, regression problem  
Discrete,   classification problem  

# I. Linear Regression
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
> J(\bm\theta) &= \frac{1}{2} \| \bm{X}\bm\theta - \bm{y}\|_ 2^2 \\
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

# I.1 LMS algorithm
* [Note 1](./cs229-2018-autumn/notes/cs229-notes1.pdf), p. 4  
* Least mean squares

Gradient descent
$$
\theta_j := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\bm\theta)
$$

where    
* $j = 0,1 \ldots ,n$
* $\alpha$ is the learning rate.  

26:04

Set $\alpha = 0.01$ in practice.


[Lecture 2@30:27](https://youtu.be/4b4MUYve_U8?si=rp_57eeGH42uDfuo&t=1827)  
Partial derivative of ${\partial J(\theta)}/{\partial\theta_j}$
$$
\begin{align*}
\frac{\partial}{\partial\theta_j}J(\bm\theta) 
 &= \frac{\partial}{\partial\theta_j} \frac{1}{2}\sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)})^2 \\
 & = \frac{1}{2}\cdot 2 \sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \cdot 
     \frac{\partial}{\partial\theta_j}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \\
 & = \sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \cdot 
     \frac{\partial}{\partial\theta_j}(\sum_{j=0}^n \theta_jx_j^{(i)} - y^{(i)}) \\
 & = \sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \cdot x_j^{(i)} \\         
\end{align*}
$$

**Gradient descent equation**
$$
\begin{align*}
\theta_j &:= \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\bm\theta) \\
\theta_j &:= \theta_j - \alpha\sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \cdot x_j^{(i)} \\
\end{align*}
$$

* $\alpha$, learning rate
* LMS (least mean squares) update, Widrow-Hoff learning rule
* update proportional to the error, $y^{(i)} - h(x^{(i)})$
* batch gradient descent
* $J(\bm\theta)$ is a convex quadratic function

---

**Batch gradient descent**

$$
\begin{align*}
&\text{while}\ J(\bm\theta)\  \text{not converged}\\
&\qquad \text{for}\ j = 1:n \\
&\qquad\qquad \theta_j := \theta_j - \alpha\sum_{i=1}^{m}(h_\theta(\bm{x}^{(i)}) - y^{(i)}) \cdot x_j^{(i)} \\
&\qquad \text{end} \\
&\text{end}
\end{align*}
$$

<details>
<summary><b>Batch gradient descent in Julia</b></summary>

Repeat for every $j$ until converge

```julia
# Batch gradient descent
# size(x) == (m,n)
# m >> n
# θ[n], x[m,n], y[m]
function h(θ,xi)
    return θ .* xi
end

while !converged()
    for j in 1:n # parameters
        total = 0.0
        for i in 1:m # samples
            "Use θ from last iteration?"
            total += (h(θ, x[i,:]) - y[i])*x[i,j]
        end
        θ_new[j] = θ[j] + ⍺*total
    end
    θ = θ_new
end
```
</details>

[Lecture 2@34:26](https://youtu.be/4b4MUYve_U8?si=2W825SRd4Om_MIOe&t=2066), 3D plot  
Try $\alpha$ by $0.01, 0.02, 0.04, 0.08 \ldots$.  
[Lecture 2@37:25](https://youtu.be/4b4MUYve_U8?si=2W825SRd4Om_MIOe&t=2245), 2D plot  

---

<details><summary>Under Construction</summary>

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
#   n   1  nxm     mx1
θ = θ + ⍺ * x' * (y - h)
```
</details>

---

[Lecture 2@44:47](https://youtu.be/4b4MUYve_U8?si=vGQnctfr3f7uigsP&t=2687), stochastic gradient

**Stochastic gradient descent** is faster.

<!-- <center> <img src="stochastic_gradient_descent.png" width="80%"/> </center> -->

$$
\begin{align*}
&\text{while}\ J(\bm\theta)\  \text{not converged}\\
&\qquad\text{for}\ i = 1:m  \\
&\qquad\qquad\text{for}\ j = 1:n  \\
&\qquad\qquad\qquad \theta_j := \theta_j - \alpha(h_\theta(x^{(i)}) - y^{(i)})x_j^{(i)} \\
&\qquad\qquad\text{end} \\
&\qquad\text{end} \\
&\text{end}
\end{align*}
$$ 

* Could reduce learning rate, $\alpha$, over time

<details>
<summary><b>Stochastic gradient descent in Julia</b></summary>

```julia
for i in 1:m
    for j in 1:n
        θ[j] = θ[j] - ⍺*(h(θ,x[i,:]) - y[i]) * x[j]
    end
end
```

</details>

---

[Lecture 2@53:51](https://youtu.be/4b4MUYve_U8?si=j2zZ4OXJSM4CO52b&t=3231), the normal equations

## I.2 The normal equations
* Only works for linear regression
* Analytical solution to the minimization of $J(\bm\theta)$

[Lecture 2@56:36](https://youtu.be/4b4MUYve_U8?si=wT_tj5E-IWv74IBT&t=3396), derivation of the normal equation

$\theta \in \mathbb{R}^{n+1}$

$$
\nabla_{\bm\theta} J(\bm\theta) = 
\begin{bmatrix}
\partial J/\partial \theta_0 \\
\partial J/\partial \theta_1 \\
\partial J/\partial \theta_2 \\
\end{bmatrix}
$$






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
