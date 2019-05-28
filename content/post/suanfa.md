
---
title: "Python算法实现"
author: ' '
date: '2019-05-24'
slug: suanfa
tags: R
categories: R
---

### 7.7实验


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




```python
#实验范例3：插入排序法
def InsertionSort(A):
    for j in range(1,len(A)):
        print(A)
        key = A[j]
        i = j-1
        while i >= 0 and A[i]>key:
            A[i+1] = A[i]
            i = i-1
        A[i+1] = key
    return A
A = [31,45,35,56,37,69,310,21,12]
InsertionSort(A)
```

    [31, 45, 35, 56, 37, 69, 310, 21, 12]
    [31, 45, 35, 56, 37, 69, 310, 21, 12]
    [31, 35, 45, 56, 37, 69, 310, 21, 12]
    [31, 35, 45, 56, 37, 69, 310, 21, 12]
    [31, 35, 37, 45, 56, 69, 310, 21, 12]
    [31, 35, 37, 45, 56, 69, 310, 21, 12]
    [31, 35, 37, 45, 56, 69, 310, 21, 12]
    [21, 31, 35, 37, 45, 56, 69, 310, 12]
    




    [12, 21, 31, 35, 37, 45, 56, 69, 310]




```python
#选择排序算法：程序填空
def selection_sort(L):
    N = len(L) #提取列表长度N
    exchange_count = 0
    for i in range(0, N-1): #从0开始循环
        min_index = i #排序序列的末尾位置
        for j in range(i+1,N): #嵌套循环
            if L[min_index] > L[j]: #第一次循环L[0]>L[1] 
                min_index = j #第一次循环min_index=1  j是二者最小值的列表索引。   
                #min_index永远等于最小值索引
        #以下是移动程序
        if min_index!= i: #如果索引交换了
            L[min_index],L[i] = L[i],L[min_index] #交换值
            exchange_count += 1
        print('iteration#{}:{}'.format(i,L))
    print('Total {} swappings'.format(exchange_count))
    return L

testlist = [49,38,49,97,76,13,27,65]
selection_sort(testlist)
```

    iteration#0:[13, 38, 49, 97, 76, 49, 27, 65]
    iteration#1:[13, 27, 49, 97, 76, 49, 38, 65]
    iteration#2:[13, 27, 38, 97, 76, 49, 49, 65]
    iteration#3:[13, 27, 38, 49, 76, 97, 49, 65]
    iteration#4:[13, 27, 38, 49, 49, 97, 76, 65]
    iteration#5:[13, 27, 38, 49, 49, 65, 76, 97]
    iteration#6:[13, 27, 38, 49, 49, 65, 76, 97]
    Total 6 swappings
    




    [13, 27, 38, 49, 49, 65, 76, 97]




```python
#对于冒泡法的补充思考：能否对字符串进行排序？
def get_key(dict, value):
    return [k for k, v in dict.items() if v == value]

def bubbleStr(List):
    # 输入字母顺序字典对象
    azdict = {1:'a',2:'b',3:'c',4:'d',5:'e',6:'f',
                  7:'g',8:'h',9:'i',10:'j',11:'k',12:'l',
                  13:'m',14:'n',15:'o',16:'p',17:'q',18:'r',19:'s',
                 20:'t',21:'u',22:'v',23:'w',24:'x',25:'y',26:'z'}   
    List = list(List) #将输入的字符串转化为列表
    numList = []
    for i in List:
        c = get_key(azdict,i)
        numList.extend(c) #提取出字母列表的排序进行排序
        
    for j in range(len(numList)-1,0,-1):#从后往前循环
        #print(numList)
        for i in range(0,j):
            if numList[i]>numList[i+1]:#大小互换
                numList[i],numList[i+1] = numList[i+1],numList[i]
    delta = []
    for w in numList:
        c = azdict.get(w)
        delta.append(c)
    return delta
#输入为字符串
testlist = 'zyxwvutsrqp'
print('结果：',bubbleStr(testlist))
```

    结果： ['p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    


```python

```