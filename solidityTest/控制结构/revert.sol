// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract revertTest{

// 可直接抛出异常 并回滚
// 两种表达方式
// revert CustomError(arg1,arg2); 自定义error
// revert ("My Error string");
    function splitEther(address payable addr1, address payable addr2) public payable {
        if (msg.value % 2 == 0) { // 检查传入的ether是不是偶数
            revert("Even value revertd.");
        } 
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
    }

    //与require 区别，可以在多层条件下用。
}