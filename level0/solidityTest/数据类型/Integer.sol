// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract Integer {

    function count() pure  public {
        uint8 a = 5;
        uint8 b = 2;
        
        console.log("a+b=%s",(a+b));//加
        // console.log("a=%s",a);
        console.log("a-b=%s",(a-b));//减
        console.log("a*b=%s",(a*b));//乘
        console.log("a/b=%s",(a/b));//除
        console.log("a%b=%s",(a%b));//取模
        console.log("a**b=%s",(a**b));//幂
        console.log("a<<b=%s",(a<<b));//左移
        console.log("a>>b=%s",(a>>b));//右移
    }

    function compare() pure  public {
        uint8 a = 5;
        uint8 b = 2;

        console.log("a<=b=%s",(a<=b));//false
          console.log("a<b=%s",(a<b));//false
           console.log("a>b=%s",(a>b));//true
            console.log("a>=b=%s",(a>=b));//true
             console.log("a!=b=%s",(a!=b));//true
              console.log("a==b=%s",(a==b));//false
    }

    function bitwise() pure  public {
        uint8 a = 5;
        uint8 b = 2;

        console.log("a&b=%s",(a&b));//按位与
          console.log("a|b=%s",(a|b));//按位或
           console.log("a^b=%s",(a^b));//按位异或
            console.log("~b=%s",(~b));//按位取反
    }

    function overflow() pure public{
        uint8 a = 5;
        uint8 b = 2;
        uint8 c = 255;
        // >0.8.0 整数溢出会 交易会终止， <0.8.0 需要Openzeppelin的SafaMath库来防止整型溢出
        // 需要注意其他的潜在风险
        c = c+1;//整型溢出，整个transaction revert
        console.log("b-a=%s",(b-a));//减，整个transaction revert
        console.log("c=%s",c);
    }
}