// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract forTest{

    function sumToN(uint16 n) public pure returns(uint16){
        uint16  sum = 0;      
        for(uint16 i1=1;i1<=n;i1++){
             sum += i1;
        }
        // 一些变式
        uint16 i = 1;
        for(;i<=n;i++){
        }

        for(;;i++){            
            if(i>n){break;}
        }

        for(;;){
            if(i>n){break;}
            i++;
        }

        for(;i<=n;){
            i++;
        }
        
        return sum;
    }
}
