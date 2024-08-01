// SPDX-License-Identifier: MIT
pragma solidity >0.6.0 <0.9.0;

contract whileTest{

//函数名与名不要相同
    function whileT(uint16 n) public pure returns(uint16){
        uint16 sum = 0;
        uint16 i = 1;
        while(i<=n){
            sum += i;
            i++;
        }
        return sum;
    }
}