// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract fixedsizebyteArrays{
    
   event Log(bytes4);

    function count() public {
        bytes1 a = 'a';
        bytes2 b = 'b';

        console.log("a==b=%s",(a==b));//加
        console.log("a<b=%s",(a<b));//加

        bytes3 s = 'abc';
        bytes4 ch = s[1];
        emit Log(ch);
        emit Log(s);

    }
   

}