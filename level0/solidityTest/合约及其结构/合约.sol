// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//合约
contract myContract{

    /**constant*/
    //constant 用来定义常量 不可更改，使用它可以避免修改不应修改的值，提高安全性
    // 必须在声明的时候赋值
    uint constant ratio = 3;

    //constant 必须是编译的时候就赋值。
    uint a = 2;
    // uint constant ratio1 = a; 不合法
    // uint constant ratio1; 不合法

    /**immutable*/ 
    //与 constant 类似 ，区别是 可以声明不初始化并且这种情况只能在 构造函数初始化一次。
    uint immutable im = 5;
    uint immutable im1;
    uint u;
    /**构建函数*/
    // MyContract mc = new MyContract(2);
    constructor(uint uVal) {
        // ratio = 0; // 不合法
        im = 3;
        im = 4;
        im1 = 6;
        // im1 = 7;
        u = uVal;
    }

    
    event Log(uint);
    //函数
    //声明 function mFuncName (parameter-list) visibility state mutability modifiers returns(return-list) {}
    // visibility (函数可见性：internal,external,private,public) 
    //state mutability  (函数状态可变性（可选），有三个选项：pure，view，payable)
    //modifiers 函数修饰器（可选），可以限制，修改函数行为
    //returns(return-list) 函数返回值列表（可选），指定返回值的类型，可以是多个值
    //{}函数体，包含实际执行的操作
    function f1(uint a1,uint b) public pure returns (uint,uint){ 
        uint c = b+1; 
        return (a1,c);
    }
    function f() public {
        // ratio = 0; // 不合法
        // im = 8; //不合法
        // im1 = 0;//不合法
        emit Log(im);
    }

}