// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract arraySlice{
    //数组切片是基于数组建立的视图，语法arr[start:end] .试图包含 start 到 end-1的元素。
    //视图是没有类型的，也不能占据存储空间。
    //数组切片只能用用作于calldata

    //数组切片截取字符串前四位   
   function extracFourBytes(string calldata payload) public pure {
        string memory leading4Bytes = string(payload[:4]);
        console.log("leading 4 bytes: %s", leading4Bytes);
    }

    

    uint[5]  storageArr = [uint(0),2,3,4,5];
    //calldata数据是不可更改的，所以你不能更改数组切片的值
    
    function foo() public {
         
        // uint[3] storage s1 = storageArr[:4]; 编译报错

    }
}