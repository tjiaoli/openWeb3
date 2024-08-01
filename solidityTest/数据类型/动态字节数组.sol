// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

//动态字节数组
contract dynamicallySizedByteArray{
    
    event Log(uint);
    event Log(bytes1);
    function dynamicallySizedByteArrayT() public {
        //两种动态字节数组 sting / bytes
        //solidity 规定在memory和calldata中的每个元素都要占用32字节的倍数，不足32会自动填充，
        //但是对于string 和 bytes没有这个限制，所以 会比bytes1[]更紧凑
        //string内部结构与bytes基本相同，但是它不能通过下标访问，也不能获取长度。对外访问接口不同，内部结构相同。

        //bytes与string 的互相转换，显示转化
        bytes memory b = new bytes(10);
        string memory bstr = string(b);
        console.log(bstr);
        string memory str = "hello world";
        bytes memory sbyt = bytes(str);
        console.log(str);

        //string不能通过下标访问，也不能获取长度会编译报错
        // uint len = str.length;
        // bytes1 b = str[0];
        uint  len = sbyt.length;
        bytes1 b1 = sbyt[0];
        emit Log(len);
        emit Log(b1);

    }

}