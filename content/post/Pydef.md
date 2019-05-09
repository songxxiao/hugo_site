---
title: "Python函数与模块的使用"
author: " "
date: "2019-05-08"
categories: ["R"]
slug: pydef
tags: ["R Markdown"]
---
# 函数与模块的使用

### 实验范例6.7.2


```python
#(1)
def star(m,n):
    for i in range(m):
        print('*'*n)
star(3,2)         
```

    **
    **
    **
    


```python
star(5,6)      
```

    ******
    ******
    ******
    ******
    ******
    


```python
star(4,20) 
```

    ********************
    ********************
    ********************
    ********************
    


```python
#(2)
def paint(m,s):
    print(s*m)
paint(3,'*')
```

    ***
    


```python
paint(8,'%+')
```

    %+%+%+%+%+%+%+%+
    


```python
#(3)
def check(a):
    if a>0:
        print('>0')
    elif a < 0:
        print('<0')
    else:
        print("==0")
check(5)
```

    >0
    


```python
check(-2)
```

    <0
    


```python
check(0)
```

    ==0
    


```python
#(4)
def avg(a,b):
    return(a+b)/2

c = avg(4,6)
c
```




    5.0




```python
x = avg(3,6)
x
```




    4.5




```python
y = avg(3,avg(5,7))
y
```




    4.5




```python
#（5）
def avg(a,b):
    return(a+b)/2
    return(a+b) #可以有多条return语句，但只执行一条
avg(4,6)
```




    5.0




```python
#（6）
def avg(a,b=0):#默认参数
    return(a+b)/2
avg(6)
```




    3.0




```python
#（7）
def more(a,b):
    return a+b,a-b
more(2,3) #return语句可以返回多个值
```




    (5, -1)




```python
#（8）
def more(a,b):
    return
more(2,3) #return后面可以没有返回值
```

### 实验内容


```python

```
