# Introduction to Machine Learning using the Julia Programming Language

[YouTube](https://www.youtube.com/playlist?list=PLhQ2JMBcfAsi76O13sJzk4LXA_mu5sd9E)



## Tutorial 05x02
* [YouTube](https://www.youtube.com/watch?v=n03pSsA7NtQ&list=PLhQ2JMBcfAsi76O13sJzk4LXA_mu5sd9E&index=2&t=146s)
* `sl_regression.jl`
* [`housingdata.csv`](https://raw.githubusercontent.com/julia4ta/tutorials/master/Series%2005/Files/housingdata.csv)

Linear regression model 

$$h(x) = \theta_0 + \theta_1 x$$

Cost function
$$
J = \frac{1}{2m} \sum(h(x) - Y)^2 = \frac{1}{2m} \sum(\theta_0 + \theta_1 x - Y)^2
$$

**Gradient descent algorithm**
$$
a_{n+1} = a_n - \alpha f^\prime(a_n)
$$
Two variables in this case
$$
\begin{align*}
\theta_0 := \theta_0 - \alpha\frac{\partial J}{\partial \theta_0} \\
\theta_1 := \theta_1 - \alpha\frac{\partial J}{\partial \theta_1}
\end{align*}
$$

$$
\begin{align*}
\theta_0 & := \theta_0 - \alpha\frac{1}{m}\sum_{i=1}^{m}(h_\theta(x^{(i)}) - y^{(i)}) \\
\theta_1 & := \theta_1 - \alpha\frac{1}{m}\sum_{i=1}^{m}(h_\theta(x^{(i)}) - y^{(i)})\cdot x^{(i)}
\end{align*}
$$

<!--
<figure>
<center>
    <img src="gradient_descent.png" width="60%"
         alt="Gradient descent">
    <figcaption>Gradient descent, Time: 19:34</figcaption>
</center>
</figure>
-->

where $\alpha$ is the learning rate (hyperparameter).


## Tutorial 05x03
* [YouTube](https://www.youtube.com/watch?v=fiB7vjlcx0w&list=PLhQ2JMBcfAsi76O13sJzk4LXA_mu5sd9E&index=3)
* `learn_05x03_Zsl_regression.jl`
* [`wolfspider.csv`](https://raw.githubusercontent.com/julia4ta/tutorials/master/Series%2005/Files/wolfspider.csv)

Logistic regression

logistic curve, Sigmoid curve

$$
f(x) = \frac{1}{1+e^{-x}}
$$


Cost function
$$
J = -\frac{1}{m} \sum_{i=1}^m \left[ (y^{(i)} \cdot \log(h_\theta(x^{(i)})) + (1-y^{(i)})\log(1-h_\theta(x^{(i)})) \right]
$$

## Tutorial 05x04
* [YouTube](https://www.youtube.com/watch?v=FTG4zYs9RUc&list=PLhQ2JMBcfAsi76O13sJzk4LXA_mu5sd9E&index=4&t=2s)