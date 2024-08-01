// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//与java类似
contract ifElse{

        function ifElseT()public pure returns (string memory){
            uint  num  = 11;
            string  memory name = "11";
            if(num > 11){
                name = "12";
            }else if(num == 11){
                name = "11";
            }else{
                name = "10";
            }
            return name;
        }
}