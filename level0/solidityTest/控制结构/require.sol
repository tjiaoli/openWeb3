// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract requireTest{
    //异常处理 状态回滚 
    //Solidity 的三种异常处理的函数 ：require assert revert

    //require 函数通常有下面的几种用途 ： 稽查输入参数 ，检查返回结果 ，在实际执行函数前检查是否满足预设调价
    //一般请款下都是在函数开始就用require进行校验
    function splitEther(address payable addr1, address payable addr2) public payable {
        require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
    }
}