// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//结构体 类似实体类？
contract structT{

    event Log(string);
    event Log(uint);
    event Log(Book[]);
    //可以把多个不同类型数据绑在一起方便进行统一管理
    //可以一次性向函数传入多个值，而不需要把其展开成多个参数
    //同理，返回值也可以是结构体
    //结构体加强了solidity的表达能力。使代码更加易读

    //定义 关键字struct
    struct Book {
        string title;
        uint price;
    }
    Book[] public lib;
    function structTest() public {   
        //声明结构体
        Book memory book;
        //结构体初始化 两种方式 不能落下每个成员
        book = Book({
            title :unicode"图书1",
            price : 1
        });
        Book memory book2 = Book(unicode"图书2",1);

        //获取结构体成员
        emit Log(book2.title);

        book.price = 123;//给结构体成员赋值
        emit Log(book.price);

        //结构体可以和数组、映射类型互相嵌套
        //结构体数组
        lib.push(book);
        emit Log(lib);
    

    }
    //结构体中也可以出现数组
    struct BookT {
        string title;
        uint price;
        string[] author;
    }

    
}