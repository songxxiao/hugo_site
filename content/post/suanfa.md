
---
title: "算法实现与性能分析"
author: ' '
date: '2019-05-24'
slug: suanfa
tags: R
categories: R
---
```python
#实验范例（1）：折半查找算法
def BinarySearch(a,target):
    left = 0
    right = len(a) - 1
    while left <= right:
        mid = (left + right)//2
        midVal = a[mid]
        if midVal <target:
            left = mid + 1
        elif midVal > target:
            right = mid - 1
        else:
            return mid
    return - 1
L = [5,7,13,25,32,46,54,62,78,83,88,91,99]
BinarySearch(L,13)
```




    2




```python
#冒泡排序法
def bubble(List):
    for j in range(len(List)-1,0,-1):
        print(List)
        for i in range(0,j):
            if List[i]>List[i+1]:List[i],List[i+1] = List[i+1],List[i]
    return List
testlist = [49,38,65,97,76,13,27,49]
print('结果：',bubble(testlist))
```

    [49, 38, 65, 97, 76, 13, 27, 49]
    [38, 49, 65, 76, 13, 27, 49, 97]
    [38, 49, 65, 13, 27, 49, 76, 97]
    [38, 49, 13, 27, 49, 65, 76, 97]
    [38, 13, 27, 49, 49, 65, 76, 97]
    [13, 27, 38, 49, 49, 65, 76, 97]
    [13, 27, 38, 49, 49, 65, 76, 97]
    结果： [13, 27, 38, 49, 49, 65, 76, 97]
    

### 实验内容


```python
#（1）找出最大最小值

lst = [31,45,35,56,37,69,310,21,12]

def max2(List):
    for j in range(len(List)-1,0,-1):
        for i in range(0,j):
            if List[i]>List[i+1]:List[i],List[i+1] = List[i+1],List[i]
    return List[len(List)-1]

max2(lst)        

```




    310




```python
# 找出列表最小值
def min2(List):
    for j in range(len(List)-1,0,-1):
        for i in range(0,j):
            if List[i]>List[i+1]:List[i],List[i+1] = List[i+1],List[i]
    return List[0]
min2(lst) 
```




    12




```python
# 折半查找算法，有多个则返回第一个。
def BinarySearch(a,target):
    left = 0
    right = len(a) - 1
    while left <= right:
        mid = (left + right)//2 #整除，提取中点
        midVal = a[mid]
        if midVal < target: #在中点右侧寻找
            left = mid + 1
        elif midVal > target: #在中点左侧寻找
            right = mid - 1
        else:
            return a.index(midVal) #返回第一个查找值
    return - 1
L = [32,32,32,32,32,46,54,62,78,83,88,91,99]
L2 = [54,62,78,32,32,32,32,32,46,83,88,91,99]
BinarySearch(L2,32)
```




    3




```python
#顺序搜索算法
Lst = [31,45,35,56,37,69,310,21,12]
def sequen(lst,x):
    i = 0
    while i < len(lst):
        if lst[i] == x:
            return i
        i += 1
    else: return -1
sequen(Lst,56)
```




    3


