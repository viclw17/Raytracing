# Chapter 0: Overview
## [问题一：CodeBlocks环境搭建及创建第一个C++程序](https://blog.csdn.net/libing_zeng/article/details/54410627)

### Using Command Line
* Windows

Run command line ```g++ main.cpp``` in Cygwin, and this output a ```a.exe``` file. Run the file with ```./a.exe``` and this generate the final file ```test.ppm```. File can be opened with **FXnView**.

* Mac

A ```a.out``` file is generated instead.

# Chapter 1: Output an image
## 问题二：用C++输出第一张图片
将结果输出到文件
```c
#include <fstream>
/*iostream是输入输出流库标准文件（注意它没有后缀），它包含cout的信息，这对我们的程序是必需的。#include是预处理器指示符（preprocessor directive），它把iostream的内容读入我们的文本文件中*/
ofstream outfile( ".\\results\\FirstImage.txt", ios_base::out);
/*打开当前目录（工程目录）下results文件夹中的FirstImage.txt文件*/
outfile << "P3\n" << nx << " " << ny << "\n255\n";
/*往文件中写入数据*/
```
顺便说一下标准输出：
```c
#include <iostream>
using namespace std;
/*这条语句被称作using指示符（using directive）。 C++标准库中的名字都是在一个称作std的名字空间中声明的，这些名字在我们的程序文本文件中是不可见的，除非我们显式地使它们可见。using指示符告诉编译器要使用在名字空间std中声明的名字。*/
std::cout << "P3\n" << nx << " " << ny << "\n255\n";
/*往屏幕上输出数据*/
```

# Chapter 2: The vec3 class

## 问题三：类的头文件和实现文件分别写什么（用向量表示RGB输出“第一张图片”）
- http://www.cnblogs.com/ider/archive/2011/06/30/what_is_in_cpp_header_and_implementation_file.html

## 问题四：C++中inline是干嘛用的
TBC

## 问题五：C++中const是干嘛用的
- http://www.cnblogs.com/lichkingct/archive/2009/04/21/1440848.html
- https://blog.csdn.net/u010370871/article/details/48157447
- http://duramecho.com/ComputerInformation/WhyHowCppConst.html
### 1. Simple Use of ‘const’ 修饰变量->定义常量
```c
// 1. const修饰变量
const int  a=5;
int  const a=5;
// 2. const修饰指针
// 2.1 指针是常量不可变
// const修饰的类型为char*的变量 pContent 为常量，因此，pContent的 指针本身 为常量不可变
char * const pContent;
const char * pContent;
// 2.2 指针指向的内容不可变
// const修饰的类型为char的变量 *pContent 为常量，因此，pContent的 内容 为常量不可变
const char *pContent;
char const *pContent;
// 2.3 指针本身和指针内容两者皆为常量不可变
const char* const pContent;
```
>tips：
const在```*```左边表示const修饰的是指针p指向的内容；
const在```*```右边表示const修饰的是指针p；

It also works with pointers but one has to be careful where ‘const’ is put as that determines whether the pointer or what it points to is constant. For example,

- **_const_ int * Constant2**
    - declares that Constant2 is a variable pointer to a constant integer and
- **int _const_ * Constant2**
    - is an alternative syntax which does the same, whereas
- **int * _const_ Constant3**
    - declares that Constant3 is constant pointer to a variable integer and
- **int _const_ * _const_ Constant4**
    - declares that Constant4 is constant pointer to a constant integer.


Basically ‘const’ applies to whatever is on its **immediate left** (other than if there is nothing there in which case it applies to whatever is its **immediate right**).

Of the possible combinations of pointers and ‘const’, the **constant pointer to a variable is useful for storage that can be changed in value but not moved in memory**.

Even more useful is **a pointer (constant or otherwise) to a ‘const’ value**. This is useful for returning constant strings and arrays from functions which, because they are implemented as pointers, the program could otherwise try to alter and crash. Instead of a difficult to track down crash, the attempt to alter unalterable values will be detected during compilation.

### 2. Use of ‘const’ in Functions Return Values 修饰函数返回值
const修饰函数返回值其实用的并不是很多，它的含义和const修饰普通变量以及指针的含义基本相同。

- ```const int fun1()```
    - 函数返回的是值（不是指针）, 无意义, 因为参数返回本身就是赋值。
- ```const int * fun2()```
    - 函数返回的是指针（不是值）, 调用时 ```const int *pValue = fun2();```
    - 我们可以把fun2()看作成一个变量，即 **指针内容** 不可变。
- ```int* const fun3()```
    - 函数返回的是指针（不是值）调用时 ```int * const pValue = fun2();```
    - 我们可以把fun2()看作成一个变量，即 **指针本身** 不可变。


Even more useful is a pointer (constant or otherwise) to a ‘const’ value. This is useful for returning constant strings and arrays from functions which, because they are implemented as pointers, the program could otherwise try to alter and crash. Instead of a difficult to track down crash, the attempt to alter unalterable values will be detected during compilation.

### 3. In Parameter Passing 修饰函数参数
```c
void function(const int Var);  //传递过来的参数在函数内不可以改变，无意义，因为Var是形参
void function(char * const Var);//传递过来的参数指针本身 为常量不可变,无意义，因为char* Var也是形参
// const修饰指针指向的内容不变
void function(const char * Var);//传递过来的参数指针所指内容 为常量不可变
// 参数为引用，增加效率，为了防止参数在函数体内被修改所以加上const
void function(const TYPE& Var);// explained below!
```
But where does ‘const’ come into this? Well, there is a second common use for passing data by reference or pointer instead of as a copy. That is **when copying the variable would waste too much memory or take too long**. This is particularly likely with large & compound user-defined variable types (‘structures’ in C & ‘classes’ in C++). So a subroutine declared

```
void Subroutine4(big_structure_type &Parameter1);
```

might being using ‘&’ because it is going to alter the variable passed to it or it might just be to save copying time and there is no way to tell which it is if the function is compiled in someone else’s library.

**This could be a risk if one needs to trust the subroutine not to alter the variable.** To solve this, ‘const’ can be used in the parameter list. E.g.

```
void Subroutine4(big_structure_type const &Parameter1);
```

which will cause the variable to be **passed without copying but stop it from then being altered**. This is messy because it is essentially making an in-only variable passing method from a both-ways variable passing method which was itself made from an in-only variable passing method just to trick the compiler into doing some optimization.

Ideally, the programmer should not need control this detail of specifying exactly how it variables are passed, just say which direction the information goes and leave the compiler to optimize it automatically, but C was designed for raw low-level programming on far less powerful computers than are standard these days so the programmer has to do it explicitly.

### 4. In the Object Oriented Programming 修饰函数
const修饰 **类的对象** 表示该对象为 **常量对象**，其中的任何成员都不能被修改。对于对象指针和对象引用也是一样。该对象的任何 **非const成员函数** 都不能被调用，因为任何非const成员函数会有修改成员变量的企图。
```
class AAA{
    void func1();
    void func2() const;
}

const AAA aObj;
aObj.func1(); // wrong!!!
aObj.func2(); // 正确

const AAA* aObj = new AAA();
aObj->func1(); // wrong
aObj->func2(); // 正确
```
const修饰 **类的成员变量**，表示成员常量，不能被修改，同时它只能在初始化列表中赋值。
```
class A{
    const int nValue;       //成员常量不能被修改
    A(int x): nValue(x) {}; //只能在初始化列表中赋值
}
```
const修饰 **类的成员函数**，则该成员函数不能修改类中任何 **非const成员变量**。
**一般写在函数的最后来修饰**
```
class A{
    void function()const; //常成员函数, 它不改变对象的成员变量. 也不能调用类中任何非const成员函数。
}
```

In Object Oriented Programming, calling a ‘method’ (the Object Oriented name for a function) of an object gives an extra complication. As well as the variables in the parameter list, the method has access to the member variables of the object itself which are always passed directly not as copies. For example a trivial class, ‘Class1’, defined as

```
class Class1{
    void Method1();
    int MemberVariable1;
}
```
has no explicit parameters at all to ‘Method1’ but calling it in an object in this class might alter ‘MemberVariable1’ of that object if ‘Method1’ happened to be, for example,
```
void Class1::Method1(){
    MemberVariable1=MemberVariable1+1;
}
```

The solution to that is to put ‘const’ after the parameter list like
```
class Class2{
    void Method1() const;
    int MemberVariable1;
}
```
which will ban Method1 in Class2 from doing anything which can attempt to alter any member variables in the object.

Of course one sometimes needs to combine some of these different uses of ‘const’ which can get confusing as in
```
const int*const Method3(const int*const&)const;
```
where the 5 uses ‘const’ respectively mean that the variable pointed to by the returned pointer & the returned pointer itself won’t be alterable and that the method does not alter the variable pointed to by the given pointer, the given pointer itself & the object of which it is a method!.

### const常量与define宏定义的区别
1. 编译器处理方式不同
    - define宏是在预处理阶段展开。
    - const常量是编译运行阶段使用。
2. 类型和安全检查不同
    - define宏没有类型，不做任何类型检查，仅仅是展开。
    - const常量有具体的类型，在编译阶段会执行类型检查。
3. 存储方式不同
    - define宏仅仅是展开，有多少地方使用，就展开多少次，不会分配内存。
    - const常量会在内存中分配(可以是堆中也可以是栈中)。

## 问题六：C++中&是干嘛用的（引用类型）
https://blog.csdn.net/libing_zeng/article/details/54412728
>顺便说一下：```int *pi1```，```int* pi1```，```int * pi1```是等价的。也就是说 ```*``` 靠谁近或者之间有没有空格，并不影响功能。但是推荐使用```int *pi1```，因为考虑到一连串定义几个变量时可能出错。比如：```int *pi1, *pi2, *pi3；```而不是```int*pi1, pi2, pi3```。

>同理，“&”也是一样的。```int & ri1```，```int& ri1```，```int &ri1```是等价的。推荐使用```int &ri1```

When a **subroutine or function** is called with parameters, variables passed as the parameters might be read from in order to transfer data into the subroutine/function, written to in order to transfer data back to the calling program or both to do both.

Some languages enable one to specify this directly, such as having ```in:, out: inout:``` parameter types, whereas in C one has to work at a lower level and specify the method for passing the variables choosing one that also allows the desired data transfer direction.

For example, a subroutine like
```
void Subroutine1(int Parameter1)
{ printf("%d",Parameter1);}
```
accepts the parameter passed to it in the default C & C++ way - which is a **copy**. Therefore the subroutine can read the value of the variable passed to it but not alter it because any alterations it makes are only made to the copy and are lost when the subroutine ends. E.g.
```
void Subroutine2(int Parameter1)
{ Parameter1=96;}
```
would leave the variable it was called with unchanged not set to 96.

The addition of an ‘&’ to the parameter name in C++ causes the actual variable itself, rather than a copy, to be used as the parameter in the subroutine and therefore can be written to thereby passing data back out the subroutine. Therefore
```
void Subroutine3(int &Parameter1)
{ Parameter1=96;}
```
would set the variable it was called with to 96. This method of passing a variable as itself rather than a copy is called a **reference** in C++.

That way of passing variables was a C++ addition to C. To pass an alterable variable in original C, a rather involved method was used. This involved using a **pointer** to the variable as the parameter then altering what it pointed to was used. For example
```
void Subroutine4(int *Parameter1)
{ *Parameter1=96;}
```
works but requires the every use of the variable in the called routine altered like that and the calling routine also altered to pass a pointer to the variable. It is rather **cumbersome**.

## 问题七：operator+=()是什么鬼函数？（重载操作符）
https://blog.csdn.net/My_heart_/article/details/51534624

operator是C++的关键字，它和运算符一起使用，表示一个运算符函数，理解时应将operator=整体上视为一个函数名。
这是C++扩展运算符功能的方法，虽然样子古怪，但也可以理解：一方面要使运算符的使用方法与其原来一致，另一方面扩展其功能只能通过函数的方式（c++中，“功能”都是由函数实现的)。

### 一、为什么使用操作符重载？
对于系统的所有操作符，一般情况下，只支持基本数据类型和标准库中提供的class，对于用户自己定义class，如果想支持基本操作，比如比较大小，判断是否相等，等等，则需要用户自己来定义关于这个操作符的具体实现。比如，判断两个人是否一样大，我们默认的规则是按照其年龄来比较，所以，在设计person 这个class的时候，我们需要考虑操作符==，而且，根据刚才的分析，比较的依据应该是age。那么为什么叫重载呢？这是因为，在编译器实现的时候，已经为我们提供了这个操作符的基本数据类型实现版本，但是现在他的操作数变成了用户定义的数据类型class，所以，需要用户自己来提供该参数版本的实现。



### 二、如何声明一个重载的操作符？
#### A:  操作符重载实现为类成员函数
重载的操作符 **在类体中被声明**，声明方式如同普通 **成员函数** 一样，只不过他的名字包含关键字```operator```，以及紧跟其后的一个C++预定义的操作符。可以用如下的方式来声明一个预定义的==操作符:
```c
// 在类体中被声明
class person{
private:
    int age;
public:
    person(int a){ //构造函数
       this->age = a;
    }
    // 操作符重载实现为类成员函数
    inline bool operator == (const person &ps) const;
};

// 实现方式如下：
inline bool person::operator==(const person &ps) const{
    if (this->age==ps.age)
        return true;
    return false;
}

// 调用方式如下：
#include<iostream>
using namespace std;
int main()
{
    person p1(10);
    person p2(20);
    if(p1==p2)
        cout<<”the age is equal!”< return 0;
}
```
这里，因为operator == 是class person的一个成员函数，所以对象p1,p2都可以调用该函数，上面的if语句中，相当于p1调用函数==，把p2作为该函数的一个参数传递给该函数，从而实现了两个对象的比较。

#### B:操作符重载实现为非类成员函数(全局函数)
对于全局重载操作符，代表左操作数的参数必须被显式指定。例如：
```c
#include<iostream>
using namespace std;
class person{
public:
    int age;
public:
    // construct with age
    // initializer list https://www.geeksforgeeks.org/when-do-we-use-initializer-list-in-c/
    person(int _age=0):age(_age){
    	cout << "person(int _age)"<< endl;
    }
    // construct with another object
    person(person& ps){
    	*this = ps;
    }
};

//类的外边
bool operator==(person& p1, person const & p2){ //全局重载操作符==
    if (p1.age == p2.age)
    {
    	return true; //满足要求
    }
    return false;
}

int main(){
    person rose;
    person jack;
    rose.age = 18;
    jack.age = 23;
    if (rose == jack)
    {
    	cout << " is equal " << endl;
    }
    cout << "not equal " << endl;
    return 0;
}
```

#### C:如何决定把一个操作符重载为类成员函数还是全局名字空间的成员呢？
1. 如果一个重载操作符是 **类成员**，那么只有当它的 **左操数是该类的对象** 时，该操作符才会被调用。如果该操作符的左操作数必须是其他的类型，则操作符必须被重载为全局名字空间的成员。
2. C++要求赋值=，下标[]，调用()，和成员指向-> 操作符必须被定义为 _类成员操作符_。任何把这些操作符定义为名字空间成员的定义都会被标记为编译时刻错误。
3. 如果有一个操作数是类类型如string类的情形那么对于对称操作符比如等于操作符最好定义为全局名字空间成员。

#### D:操作符重载适用范围：
#### E:重载运算符的限制：
1. 只有C++预定义的操作符才可以被重载；
2. 对于内置类型的操作符，它的预定义不能改变，即不能改变操作符原来的功能；
3. 重载操作符不能改变他们的操作符优先级；
4. 重载操作符不能改变操作数的个数；
5. 除了对（）操作符外，对其他重载操作符提供缺省实参都是非法的；

#### F:注意
1. 当返回值不是本函数内定义的局部变量时就可以返回一个引用。在通常情况下，引用返回值只用在需对函数的调用重新赋值的场合，也就是对函数的返回值重新赋值的时候。

（以重载赋值= 为例！）
- 如果返回值：返回的局部对象，在赋值语句结束之后释放，函数返回时保存的临时变量为该对象；
- 如果返回引用：返回的局部对象，在函数返回时释放，函数返回时保存的临时变量为该对象的引用(地址)；

2. **在增量运算符中，放上一个整数形参，就是后增量运行符，它是值返回; 对于前增量没有形参，而且是引用返回。** 例如：
```c
class Test{
public:
    Test(int x = 3){
    	m_value = x;
    }
      Test& operator++(); // 前增量没有形参, 引用返回
      Test operator++(int); // 后增量整数形参, 值返回
private:
	int m_value;
};

Test& Test::operator++(){
    m_value++;    //先增量
    return *this; //返回当前对象
}

Test Test::operator++(int){
    Test temp(*this);  //创建临时对象
    m_value++;         //再增量
    return temp;       //返回临时对象
}
```

## 问题八：C++中this是干嘛用的
每个 **类成员函数** 都含有一个 **指向被调用对象的指针**，这个指针被称为this。
- this表示被调用对象的指针；
- *this表示被调用对象本身；

## 问题九：C++中::是干嘛用的（域解析操作符）
## 问题十：【总结】解决了问题四~问题九，vec3这个类的代码应该都能看懂了

# Chapter 3: Rays, a simple camera, and background
## 问题十一：用条件编译（#if…#endif）避免 main函数中测试代码在测试完成后就删除
```c
#define testNumber 3
/*
1: output the first image
2: test "int &ri，int& ri，int*&pri"
3: output the first image by using vector.
*/
#if testNumber == 1 /*1: output the first image*/
//完整的测试代码1
#elif testNumber == 2 /*2: test "int &ri，int& ri，int*&pri"*/
//完整的测试代码2
#elif testNumber == 3 /*3: output the first image by using vector.*/
//完整的测试代码3
#endif // testNumber
```
可以通过修改宏定义中testNumber的值来控制编译的代码块，也就是控制测试模块。想测试哪一块，就将testNumber修改成对应的值即可；想添加一个新的测试块，在添加一个“#elif testNumber == …”即可。

## 问题十二：怎么用ray tracing画第一张图
see --> note-theories

# Chapter 4: Adding a sphere
## 问题十三：怎么用ray tracing画个球

# Chapter 5: Surface normals and multiple objects
## 问题十四：怎么可视化球的法向量
see --> note-theories
## 问题十五：C++中抽象类，虚函数是什么鬼？怎么测试
### 纯虚函数
纯虚函数是在 **基类中声明的虚函数**，它在 **基类中没有定义**，但要求任何派生类都要定义自己的实现方法。在基类中实现纯虚函数的方法是在函数原型后加“=0”

### 引入原因
1. 为了方便使用 **多态** 特性，我们常常需要在基类中定义虚拟函数。
2. 在很多情况下，基类本身生成对象是不合情理的。_例如，动物作为一个基类可以派生出老虎、孔雀等子类，但动物本身生成对象明显不合常理。_ 为了解决上述问题，引入了纯虚函数的概念，将函数定义为纯虚函数（方法：virtual ReturnType Function() = 0;），则编译器要求在派生类中必须予以重载以实现多态性。同时含有纯虚拟函数的类称为 **抽象类**，它不能生成对象。这样就很好地解决了上述两个问题。

### 相似概念
多态性
指相同对象收到不同消息或不同对象收到相同消息时产生不同的实现动作。C++支持两种多态性：**编译时多态性**，**运行时多态性**。
- 编译时多态性：通过函数重载和运算符重载来实现的。
- 运行时多态性：通过继承和虚函数来实现的。

虚函数
虚函数是在基类中被声明为virtual，并在派生类中重新定义的成员函数，可实现成员函数的动态重载。纯虚函数的声明有着特殊的语法格式：virtual 返回值类型成员函数名（参数表）=0；

请注意，纯虚函数应该只有声明，没有具体的定义，即使给出了纯虚函数的定义也会被编译器忽略。

抽象类
包含纯虚函数的类称为抽象类。由于抽象类包含了没有定义的纯虚函数，所以不能定义抽象类的对象。在C++中，我们可以把只能用于被继承而不能直接创建对象的类设置为抽象类（Abstract Class）。

之所以要存在抽象类，最主要是因为它具有不确定因素。我们把那些类中的确存在，但是在父类中无法确定具体实现的成员函数称为纯虚函数。纯虚函数是一种特殊的虚函数，它只有声明，没有具体的定义。抽象类中至少存在一个纯虚函数；存在纯虚函数的类一定是抽象类。**存在纯虚函数是成为抽象类的充要条件。**

```
----------------------------------------------test_base.h----------------------------------------------
#ifndefTEST_BASE_H
#defineTEST_BASE_H
classtest_base{
public:
    // test_base() {} /*抽象类不需要构造函数，因为他不会有对象*/
    virtual void vfb() = 0; /*虚函数的声明：“virtual”+普通函数声明方式+“=0”*/
};
#endif //TEST_BASE_H
----------------------------------------------test_base.cpp----------------------------------------------
test_base.cpp为空

// 子类（继承抽象类，必须实现父类的虚函数）：test_extend1和test_extend2
----------------------------------------------test_extend1.h --------------------------------------------
#ifndefTEST_EXTEND1_H
#defineTEST_EXTEND1_H
#include<test_base.h>
classtest_extend1 : public test_base{
public:
    test_extend1() {}  /*这个一定要有，不能写成“test_extend1(); ???”*/
    virtual void vfb(); /*子类中声明虚函数：“virtual”+普通函数声明方式。注意此处没有“=0”*/
};
#endif //TEST_EXTEND1_H
----------------------------------------------test_extend1.cpp------------------------------------------
#include"test_extend1.h"
#include<iostream>
usingnamespace std;
void test_extend1::vfb(){
    /*特别注意：子类对虚函数的实现要放在.cpp中（不能放在.h中）。为什么？原因不详。但是如果放在.h编译时会报“multiple definition”的错误（搞不清为什么，不同子类对其实现时会报这样的错误，蓝瘦，香菇）*/
    std::cout <<"test_extend1::vfb()" << endl;
}

----------------------------------------------test_extend2.h--------------------------------------------
#ifndefTEST_EXTEND2_H
#defineTEST_EXTEND2_H
#include<test_base.h>
classtest_extend2 : public test_base{
public:
    test_extend2() {}
    virtual void vfb();
};
----------------------------------------------test_extend2.cpp------------------------------------------
#include"test_extend2.h"
#include<iostream>
usingnamespace std;
void test_extend2::vfb(){
    std::cout <<"test_extend2::vfb()" << endl;
}
----------------------------------------------main.cpp------------------------------------------
#include"test_extend1.h"
#include "test_extend2.h"
int main(){
    test_base *te1 = new test_extend1();
    test_base *te2 = new test_extend2(); /*新建子类对象*/
    te1->vfb();
    te2->vfb(); /*调用子类实现的父类的虚函数*/
    return 0;
}
```
## 问题十六：使用初始化列表的构造函数和使用函数体的构造函数有什么区别？
其中这条语句：
```
sphere(vec3cen, float r) : center(cen), radius(r) {}
```
就是使用初始化列表的构造函数。构造函数初始化列表以一个冒号开始，接着是以逗号分隔的数据成员列表，每个数据成员后面跟一个放在括号中的初始化式。上面这条语句做的事情是：将center初始化为cen；将radius初始化为r。特别注意这里是 **初始化**，不是赋值，不是赋值，不是赋值。

其等效的使用函数体的构造函数是：（函数体中赋值）
```
sphere(vec3 cen, float r){
     center = cen;
     radius = r;
}
```
使用初始化列表的构造函数和使用函数体的构造函数有区别吗？答案是：有
根本区别可以归结于“初始化”和“赋值”的区别
其一，“赋值”是属于计算。所以，时序上，初始化早于赋值
其二，有些类型的变量是只能初始化，不能赋值的。比如 const和引用。

看看网友怎么说：
http://blog.csdn.net/zuijinhaoma8/article/details/45919125

构造函数可以分两个阶段进行：（1）初始化阶段；（2）普通计算阶段。计算阶段也就是由函数体内所有的语句组成。不管成员是否在构造函数初始化列表中显式初始化，类的数据成员初始化总是在初始化阶段进行，**初始化阶段先于计算阶段**。构造函数初始化列表是对类的成员做初始化，而在构造函数体内只是对类的数据成员进行了一次赋值操作。

构造函数初始化列表只是指定了成员的初始值，并没有指定初始化顺序，那么成员初始化顺序又是怎样的呢？成员的初始化顺序就是定义成员的顺序，第一个定义的成员首先被初始化，然后是第二个等等。

一、若类的数据成员是静态的(const)和引用类型，必需用初始化列表
静态(const)的数据成员只能初始化而不能赋值，同样引用类型也是只可以被初始化，那么只有用初始化列表。
二、构造函数体内赋值会带来额外的开销，效率会低于构造函数初始化列表

## 问题十七：怎么用ray tracing画多个球？
