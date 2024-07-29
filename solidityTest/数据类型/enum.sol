// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract enumTest{

    
//定义枚举类型
    enum ActionChoices{
        GoLeft,
        GoRight,
        GoUp,
        GoDown
    }

    

    ActionChoices choice;
    
    function getChoice() public view returns(ActionChoices){
        return choice;
    }

    function getChoiceDown() public view returns(ActionChoices){
        //枚举类型的最大最小值
       type(ActionChoices).max;
      return type(ActionChoices).min;

        // return ActionChoices.GoDown;
    }

//枚举类型与整型的互相转换  
    function enumToUint(ActionChoices c) public pure returns(uint) {
    return uint(c);
    }

    function uintToEnum(uint i) public pure returns(ActionChoices) {
        return ActionChoices(i);
    }


}