// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";
/**
自定义值类型
*/
contract UserDefinedValueTypes{

        type Weight is uint128;
        type Price is uint128;

        event Log(Weight);
    function UserDTypes() public{
        //自定义值类型 通常以 type C is V 来定义 C为新定义的类型，V则必须是solidity的原生类型。
       Weight w = Weight.wrap(10);
       Price p = Price.wrap(5);
       console.log(Weight.unwrap(w));
       //自定义类型优点，1、提高了安全性 
    //以下编译会报错 因为 w 和 p是不同的类型，不能进行算术运算。这提高了类型安全性。避免直接使用，
    //随着代码量提高多一层限制， 一种编码规范。
    //    Weight wp =  w + p;
    //    Price p = p + w;
    //2、提高了可读性。

    //类型转换
    //C.wrap 原生转自定义  C.unwrap 原生转自定义
    Weight w1 = Weight.wrap(11);
    
    uint128 u = Weight.unwrap(w1);

    w1 = Weight.wrap(u);
    //自定义不能继承操作符，上面提到此功能也带来了安全性。
    // Weight sum = w + w1; 编译报错


    //运算需要单独写函数。

     Weight sum = add(w1,p);

     emit  Log(sum);
    }


      function add(Weight weight,Price price) public pure returns (Weight){
        return Weight.wrap(Weight.unwrap(weight)+Price.unwrap(price));
    }
}