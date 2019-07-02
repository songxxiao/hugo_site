---
title: "Python函数与模块的使用"
author: " "
date: "2019-05-08"
categories: Python
slug: pydef
tags: Python
---
```python
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
def avg(a,b):
    return(a+b)/2
    return(a+b) #可以有多条return语句，但只执行一条
avg(4,6)
```




    5.0




```python
def avg(a,b=0):#默认参数
    return(a+b)/2
avg(6)
```




    3.0




```python
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

