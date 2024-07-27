// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract dataType{

     function removeOwner() public {
        bytes memory bts1 = "btc";
        bytes memory bts2 = bts1;

        console.log("bts1: %s", string(bts1)); // bts1: btc
        console.log("bts2: %s", string(bts2)); // bts2: btc

        bts2[0] = 'e'; //这里只改了bts2[0]的值，但是你会发现bts1[0]的值也会跟着变动

        console.log("bts1: %s", string(bts1)); // bts1: etc
        console.log("bts2: %s", string(bts2)); // bts2: etc
    }
}