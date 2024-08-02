// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract modifierTest{
    //修饰器，多个函数存在相同处理逻辑的代码块，可以将重复代码抽出 这种模式被称为修饰器
     address private owner;

    constructor() {
        owner = msg.sender;
    }

    //将权限检查抽出来成为一个修饰器
    //修饰器语法
        modifier modifier1(){
            // modifier body 1
            console.log("111");
            _;//占位符 代指函数目标函数主体部分
            console.log("111222");
            // modifier body 2
        }
        modifier modifier2(){
            // modifier body 1
            console.log("222");
            _;//占位符 代指函数目标函数主体部分
            // modifier body 2
            console.log("222222");
        }
        function foo() public modifier1 {
           // modifier body 1
            // function body
            // modifier body 2
        }
        /*
            然后modifier的使用，要关注 "_;"这行代码
            "_;"是特殊的占位符，用于指示在修饰符中插入被修饰函数的代码
            保证执行完modifier代码后继续执行被修饰函数*/
            /** 多个修饰符的情况下 层层嵌套
            modifier1 {
                log(1)
                modifier2 {
                    log(2)
                    function
                    log(222)
                }
                log(1111)
                }
            */
        function foo1() public pure modifier1 modifier2 {
            // modifier1 body 1
            // modifier2 body 1
            // function body
            console.log("function");
            // modifier1 body 2
            // modifier2 body 2
        }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    function mint() external view onlyOwner{
        // require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function changeOwner() external view onlyOwner{
        // require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function pause() external view onlyOwner{
        // require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }
}