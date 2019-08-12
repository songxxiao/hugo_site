---
title: "Python面向对象基础"
author: " "
date: "2019-05-11"
categories: Python
slug: pyobject
tags: ['Python','编程基础']
---

```python
class Dog:
    def bark(self):
        print("woo woo woo")
```


```python
dog1=Dog()
dog1.bark()
```

    woo woo woo
    


```python
class Dog:
    def bark(self,xm):
        self.name = xm
        print("woo woo woo, I am "+self.name)
dog1=Dog()
dog1.bark("Lulu")        
```

    woo woo woo, I am Lulu
    


```python
##__init__()方法
class Dog:
    def __init__(self,name,color):
        self.name = name
        self.color = color
    def bark(self):
        print("woo,woo,woo,我是"+ self.name +"!")
dog1 = Dog("阿黄","黄色")
dog1.bark()
#print("刚才创建了一个狗对象，名叫："+dog1.name+"!")
#bark()
```

    woo,woo,woo,我是阿黄!
    


```python
dog1 = Dog("阿黄","黄色")
```


```python
class Dog:
    number = 0
    def __init__(self,name):
        self.name = name
        Dog.number = Dog.number + 1
    def bark(self):
        print("汪汪汪！我是"+self.name+"!")
        print("现在有%d条狗！"%Dog.number)

dog1 = Dog("阿黄")
dog1.bark()
dog2 = Dog("阿美")
dog2.bark()
```

    汪汪汪！我是阿黄!
    现在有1条狗！
    汪汪汪！我是阿美!
    现在有2条狗！
    

#### 类的继承


```python
class Dog:
    def setName(self,name):
        self.name = name
    def setColor(self,color):
        self.color = color
    def bark(self):
        print("汪汪汪！我是"+self.name+"!")

# 定义GuideDog类
class GuideDog(Dog):
    def __init__(self,name):
        Dog.setName(self,name)
 #定义子类自己的guide()方法
    def guide(self):
        print("我正在引导我的主人！")
# 创建对象
gDog1 = GuideDog('忠诚卫士')
gDog1.bark()
gDog1.guide()
```

    汪汪汪！我是忠诚卫士!
    我正在引导我的主人！
    


```python
#子类初始化与基类相同. 子类GuideDog的初始化与基类的__init__()方法相同，
#故无需重新定义，直接使用即可。
class Dog:
    def __init__(self,name):
        self.name = name
    def bark(self):
        print("汪汪汪！我是"+self.name+"!")
class GuideDog(Dog):
    def guide(self):
        print("我正在引导我的主人！")
gDog1 = GuideDog("LuLu")
gDog1.bark()
```

    汪汪汪！我是LuLu!
    


```python
gDog1.guide()
```

    我正在引导我的主人！
    


```python
class Dog:
    def __init__(self,name):
        self.name = name
    def bark(self):
        print("汪汪汪！我是"+self.name+"!")
        
class GuideDog(Dog):
    def __init__(self,name,year):
        self.workyear = year
        Dog.__init__(self,name)
        
    def guide(self):
        print("我正在引导我的主人！")
        print('我有%d年的工作经历！'%self.workyear)
# 创建一个导盲犬对象gDog1
gDog1 = GuideDog("忠诚卫士",3)
```


```python
gDog1.guide()
```

    我正在引导我的主人！
    我有3年的工作经历！
    

```python
class Rectangle:
    def __init__(self,x1,y1,x2,y2):
        self.left = x1
        self.top = y1
        self.right = x2
        self.bottom = y2
        
        self.width = self.right - self.left 
        self.height = self.bottom - self.top
    def getPerimeter(self):
        perimeter = 2*(self.width+self.height)
        return perimeter
    def getArea(self):
        area = self.width * self.height
        return area
    def draw(self):
        print("左上角：(%d,%d),右下角：(%d,%d)"%(self.left,self.top,self.right,self.bottom))
        print("[此处画出本矩形]")
```


```python
#
rec1 = Rectangle(2,3,12,8)
rec1.draw()
```

    左上角：(2,3),右下角：(12,8)
    [此处画出本矩形]
    


```python
class Member:
    def setInfo(self, xm, xb, lb):
        self.name = xm
        self.gender = xb
        self.type = lb # type 表示人员类别(lb)
    def show(self):
        print(self.name, self.gender,self.type)
        
#定义教师类
class Teacher(Member):
    def __init__(self, xm, xb, lb):
        Member.setInfo(self, xm, xb, lb)
        self.lecture = [] # 所教课程
    #方法setLecture() 输人教师所教的课程
    def setLecture(self):
        Lectures = input("请输入"+self.name+"所教课程（空格分隔，按Enter 键结束")
        for t in Lectures.split():
            self.lecture.append(t)
    def show(self):
        Member.show(self)
        print("所教课程有: " ,self.lecture)
#定义学生类
class Student(Member):
    def __init__(self, xm, xb, lb):
        Member.setInfo(self, xm, xb, lb)
        self.course = [] #所学课程
        self.score = [] #所学课程对应的成绩
        #方法setScore ()输入学生所学课程和成绩
    def setScore(self):
        Courses = input(" 请输入"+self.name+"所学课程（空格分隔，按Enter 键结束）")
        for t in Courses.split():
            self.course.append(t)
        Scores = input("请输入所学课程对应的成绩（空格分隔，按Enter键结束）")
        for t in Scores.split():
            self.score.append(int(t))
    def show(self):
        Member.show(self)
        print("所学课程为:",self.course," 对应成绩为",self.score)
```


```python
#创建对象并测试
t1 = Teacher("张明","男","教师")
t1.setLecture()
```

    请输入张明所教课程（空格分隔，按Enter 键结束混合效应模型 机器学习基础 Python数据分析
    


```python
t1.show()
s1 = Student(" 李丽","女","学生")
s1. setScore()
s1.show()
```

    张明 男 教师
    所教课程有:  ['混合效应模型', '机器学习基础', 'Python数据分析']
    


```python
# 点的位置由水平坐标x，垂直坐标y表示。move()实现点的移动。show()显示点的坐标。
class Point:
    def __init__(self,x1,y1):
        self.x = x1
        self.y = y1
    def move(self,newX,newY):
        self.x = newX
        self.y = newY
    def show(self):
        print("现在点的位置为:（%d,%d）"%(self.x,self.y))
```


```python
p1 = Point(2,3)
p1.show()
```

    现在点的位置为:（2,3）
    


```python
p1.move(5,6)
p1.show()
```

    现在点的位置为:（5,6）
    

#### 创建简单的汽车类


```python
# id 为车牌号 curSpeed为当前车速
# changeSpeed表示改变汽车的速度 stop()表示停车。
class Car:
    def __init__(self, num ,speed = 0): #两个参数num, speed
        self.id = num
        self.curSpeed = speed
#getID () 方法获取车牌号
    def getID(self):
        return self.id
         #getCurSpeed() 方法获取当前车速 
    def changeSpeed(self,newSpeed) :
        self.curSpeed = newSpeed
    def getCurSpeed(self):
        return self.curSpeed
    def stop(self):
        self.curSpeed = 0
```


```python
#创建对象并测试
c1 = Car("沪A1567")
print("车牌号为" + c1.getID() + "的车起始车速是:" ,c1.getCurSpeed())
```

    车牌号为沪A1567的车起始车速是: 0
    


```python
c1.changeSpeed(80)
print(c1.getID() + "变速后，当前车速是:", c1.getCurSpeed())
```

    沪A1567变速后，当前车速是: 80
    


```python
c1.stop()
print (c1.getID() + "停车后，当前车速是:",c1.getCurSpeed())
c2 = Car("沪B6567",20)
print( "车牌号为" + c2.getID() +"的车起始车速是:", c1. getCurSpeed())
```

    沪A1567停车后，当前车速是: 0
    车牌号为沪B6567的车起始车速是: 0
    

#### 设计一个账户类


```python

class account:
    def __init__(self,id,balance):
        self.id = id
        self.balance = balance
    
    def deposit(self,moneynum): #存款
        self.balance += moneynum
        print("您已存入%d元"%(moneynum))
    def withdraw(self,money):
        self.balance -= money
        print("您已取出%d元"%(money))
    def getBalance(self):
        return self.balance
    def printBalance(self):
        print("id为%d的账户目前的存款额度为%d元"%(self.id,self.balance))
```


```python
c1 = account(1016, 250)
c1.printBalance()
```

    id为1016的账户目前的存款额度为250元
    


```python
c1.deposit(550) #存入550元
c1.printBalance() 
```

    您已存入550元
    id为1016的账户目前的存款额度为800元
    


```python
c1.withdraw(985) #取出550元
c1.printBalance() 
```

    您已取出985元
    id为1016的账户目前的存款额度为-185元
    

#### 创建公司管理系统


```python
class Employee:
    salary = 8000 #保底工资
    def __init__(self, xm,sex,salary):
        self.xm = xm
        self.sex = sex
        #self.job = job
        self.salary = salary
    def showInfo(self): #显示基本信息函数
        print("员工姓名:%s,性别:%s,月薪:%d元"%(self.xm,self.sex,self.salary))
        
class manager(Employee): #定义子类
    def __init__(self, xm ,sex):
        Employee.__init__(self,xm,sex,slary)
    def Showbt(self,slary):
        self.slary = slary
        print("经理的工资为%d"%self.slary)
            
```


```python
r1 = Employee("李明","男")
r1.showInfo()
```

    员工姓名:李明,性别:男,月薪:8000元
    

