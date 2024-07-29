// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract array{

    event Log(uint);
    function arrayT()public{
            uint n = 2;
                uint[2] memory arr = [uint(1000),10001];
                arr[0] = 33;
                uint[] memory arr1 = new uint[](n);
                arr1[0] = 1999;
                arr1[1] = 1222;
                emit Log(arr[0]);
                emit Log(arr1[0]);
    }
}