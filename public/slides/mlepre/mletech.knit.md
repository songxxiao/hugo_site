---
title: "多层线性模型"
subtitle: "混合效应模型"
author: "宋骁"
date: "2019/06/07"
output:
  xaringan::moon_reader:
    css: [default, zh-CN.css]
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      
---
---
# OLS模型

$${y_i} = {\beta _{i0}} + {\beta _{i1}}{x_{i1}} + {\beta _{i2}}{x_{i2}} + ... + {\beta _{ik}}{x_{ik}} + {\varepsilon _i}$$

<div class="figure" style="text-align: center">
<img src="mletech_files/figure-html/ols-1.png" alt=" " width="80%" />
<p class="caption"> </p>
</div>

---
# 控制变量

$${y_i} = {\beta _{i0}} + {\beta _{i1}}{x_{i1}} + {\beta _{i2}}{x_{i2}} + ... + {\beta _{ik}}{x_{ik}} + {\varepsilon _i}$$

<div class="figure" style="text-align: center">
<img src="mletech_files/figure-html/ols2-1.png" alt=" " width="80%" />
<p class="caption"> </p>
</div>


---
# 模型

### 零模型(ANOVA)

 + 层一： 
 
$${y_{ij}} = {\beta _{0j}} + {\varepsilon _{ij}}$$
 + 层二：
 
$${\beta _{0j}} = {\gamma _{00}} + {\mu _{0j}}$$
 + 组合模型
 
$${y_{ij}} = {\gamma _{00}} + {\mu _{0j}} + {\varepsilon _{ij}}$$

其中,
${\beta _{0j}}$是第j个层2单位的平均值,

$\gamma_{00}$表示样本整体中因变量的总平均值(grand mean) ,

${\mu _{0j}}$是与第j个层2单位相联系的随机效应

---
# 随机截距模型

+ 层1

$${{\rm{y}}_{ij}} = {\beta _{0j}} + {\beta _{1j}}({x_{ij}} - {{\bar x}_{ \cdot j}}) + {\varepsilon _{ij}}$$



+ 层2

$${\beta _{0j}} = {\gamma _{00}} + {\mu _{0j}}$$

+ 组合模型

$${{\rm{y}}_{ij}} = \underbrace {{\beta _{1j}}({x_{ij}} - {{\bar x}_{ \cdot j}})}_{fixed{\rm{ }}\ effect} + \underbrace {{\gamma _{00}} + {\mu _{0j}} + {\varepsilon _{ij}}}_{random{\rm{ }}\ effect}$$

其中,
$\gamma_{00}$表示层2 所有单位的回归截距的平均值。

$\gamma_{10}$表示层2 所有单位的回归斜率的平均值。

---
# 随机截距模型

<div class="figure" style="text-align: center">
<img src="random.jpg" alt=" " width="70%" />
<p class="caption"> </p>
</div>



---

# 随机系数模型

+ 层1：

$${{\rm{y}}_{ij}} = {\beta _{0j}} + {\beta _{1j}}({x_{ij}} - {{\bar x}_{ \cdot j}}) + {\varepsilon _{ij}}$$

+ 层2：

$${\beta _{0j}} = {\gamma _{00}} + {\mu _{0j}}$$
$${\beta _{1j}} = {\gamma _{10}} + {\mu _{1j}}$$

组合模型：
$${{\rm{y}}_{ij}} = \underbrace {{\gamma _{00}} + {\gamma _{10}}({x_{ij}} - {{\bar x}_{ \cdot j}})}_{fixed{\rm{ }}\ effect} + \underbrace {{\mu _{0j}} + {\mu _{1j}}({x_{ij}} - {{\bar x}_{ \cdot j}}) + {\varepsilon _{ij}}}_{random{\rm{ }}\ effect}$$






---
# 随机系数模型

<div class="figure" style="text-align: center">
<img src="random2.jpg" alt=" " width="70%" />
<p class="caption"> </p>
</div>


---
# 完全模型(引入层2解释变量)

### 将截距和斜率作为结果的回归模型

 + 层一： 
 
$${y_{ij}} = {\beta _{0j}} + {\beta _{1j}}{x_{ij}} + {\varepsilon _{ij}}$$
 + 层二：
 
$${\beta _{0j}} = {\gamma _{00}} + {\gamma _{01}}{Z_j} + {\mu _{0j}}$$

$${\beta _{1j}} = {\gamma _{10}} + {\gamma _{11}}{Z_j} + {\mu _{1j}}$$

+ 代入得到：

$${y_{ij}} = \underbrace {{\gamma _{00}} + {\gamma _{01}}{Z_j} + {\gamma _{10}}{x_{ij}} + {\gamma _{11}}{Z_j}{x_{ij}}}_{fixed{\rm{ }}\ effect} + \underbrace {{\mu _{0j}} + {\mu _{1j}}{x_{ij}} + {\varepsilon _{ij}}}_{random{\rm{ }}\ effect}$$

---
# Stata 命令

+ **geo**为层2标识变量  

+ **z**为层2解释变量

```sql

/*零模型*/
mixed LogY || geo: , variance

/*随机系数模型*/
mixed LogY x1 || geo: x1, variance

/*随机截距模型*/
mixed LogY x1 || geo: , variance

/*完全模型*/
mixed LogY x1 z x1#z || geo: x1, variance


```

---
# Stata 结果

```sql
---------------------------------------------------------------------------------
        logearn |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
*           sex |  -.1021119   .0056038   -18.22   0.000    -.1130951   -.0911287
                |
*c.edu#c.gross_d |   .0522439   .0053278     9.81   0.000     .0418016    .0626861
                |
*c.exp#c.gross_d |   .0296185   .0022522    13.15   0.000     .0252043    .0340326
                |
* cpc#c.gross_d |
             0  |   .4988212   .1412165     3.53   0.000     .2220419    .7756005
             1  |   .6602415   .1429999     4.62   0.000     .3799669    .9405162
                |
          _cons |    6.55398   .0724285    90.49   0.000     6.412022    6.695937
---------------------------------------------------------------------------------
```
---

+ 随机效应部分只能估计方差

```sql
------------------------------------------------------------------------------
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
geo: Independent             |
*                   var(edu) |  .0003426   .0000766       .000221    .0005311
*                   var(exp) |   .0000679   .0000139      .0000454    .0001015
*                 var(_cons) |   .0426246   .0099379        .02699     .067316
-----------------------------+------------------------------------------------
               var(Residual) |   .1140834   .0012884      .1115859    .1166367
------------------------------------------------------------------------------
LR test vs. linear model: chi2(3) = 3213.39               Prob > chi2 = 0.0000

```

---
#增长曲线模型

+ 将时间变量纳入层1


