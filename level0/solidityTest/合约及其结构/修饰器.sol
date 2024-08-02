// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract modifierTest{
    //修饰器，多个函数存在相同处理逻辑的代码块，可以将重复代码抽出 这种模式被称为修饰器
     address private owner;

    constructor() {
        owner = msg.sender;
    }

    //将权限检查抽出来成为一个修饰器
    //修饰器语法
    /**
        modifier modifier1(){
            // modifier body 1
            _;//占位符 代指函数目标函数主体部分
            // modifier body 2
        }
        modifier modifier2){
            // modifier body 1
            _;//占位符 代指函数目标函数主体部分
            // modifier body 2
        }
        function foo() public modifier1 {
            modifier body 1
            // function body
            modifier body 2
        }
        function foo() public modifier1, modifier2, modifier3 {
            // function body
        }
    */
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