// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract doWhileTest{

//do while 与 while 的区别是循环体会先执行一遍,或者说至少执行一遍
    function sumToN(uint16 n) public pure returns (uint){
        uint16 sum = 0;
        uint16 i = 1;
        do{
            sum += i;
            i++;
        }while(i<=n);
        return sum;
    }
}