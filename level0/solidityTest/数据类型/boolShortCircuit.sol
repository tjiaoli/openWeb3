// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "hardhat/console.sol";

contract BoolShortCircuit{
    uint256 public zeroCount = 0;

    function isEven(uint256 num) private pure returns(bool){
        return num%2 == 0 ;
    }
    //iszero函数有副作用，会改变状态变量zeroCount的值
    function isZero(uint256 num) private returns(bool){
        if(num==0){
            zeroCount += 1;// 函数副作用，会改变zeroCount的值
        } 
        return num == 0;
    }


    function BoolShortCircuitTEST() public { 
        console.log(unicode"逻辑与: %s",(isEven(1) && isZero(0)));//false&&true   断路      返回false
        console.log(unicode"逻辑与: %s",(isEven(2) && isZero(0)));//true&&true    未断路    返回true
        console.log(unicode"逻辑或: %s",(isEven(1) || isZero(0)));//false||true   未断路    返回true
        console.log(unicode"逻辑或: %s",(isEven(2) || isZero(0)));//true || true  断路      返回true
    }
}