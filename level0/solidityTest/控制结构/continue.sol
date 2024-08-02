// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract continueT{

        //continue 跳过本轮循环
        function printOddNumbers() public pure{
            for (uint i = 1; i <= 10; i++) {
                if (i%2 == 0) { // 如果是偶数，跳过本次循环
                    continue;
                }
                console.log(i); // 如果是奇数，就打印输出
            }
        }
}