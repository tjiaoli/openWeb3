// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract breakTest{

//break 跳出当前循环
    function hasSpace(string memory input) public pure returns (bool) {
    bool result;
    for (uint i = 0; i < bytes(input).length; i++) {
        if (bytes(input)[i] == " ") { // 检查当前字符是否是空格
            result = true;
            break; // 如果当前字符是空格，跳出循环
        }
    }
    // do something
    console.log("result is: %s", result);
    return result;
}
}