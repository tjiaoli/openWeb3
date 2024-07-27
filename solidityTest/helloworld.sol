// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract helloworld{
    string storeMsg;

    function set(string memory message) public{
        storeMsg = message;
    }

    function get()public view returns(string memory) {
        return storeMsg;
    }
}