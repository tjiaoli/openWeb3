// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//映射类型
contract map{
    event Log(uint);
    struct AirDrop{
        address to;
        uint amount;
    }

    AirDrop[] airDrop;
    
    mapping(address => uint) airDrop1;

    function getAirDropAmount(address addr) public view returns(uint) {
        for(uint i = 0; i < airDrop.length; i++) {
            if(airDrop[i].to == addr) {
                return airDrop[i].amount;
            }
        }
        return 0;
         
    }


    // 编译错误，映射类型作为入参和返回值时，函数可见性必须是 private 或 internal
    // function invalidDeclaration(mapping(address => uint) storage myMap) public {} 

    // 编译错误，映射类型作为入参和返回值时，函数可见性必须是 private 或 internal
    // function invalidDeclaration(mapping(address => uint) storage myMap) external {}

    // 合法
    function validDeclaration(mapping(address => uint) storage myMap) private {
        myMap[0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990] = 100;
        uint amount = myMap[0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990];
        emit Log(amount);
    } 
    // 合法
    function validDeclaration1(mapping(address => uint) storage myMap) internal {} 
    
    //结构体和映射类型嵌套
    struct Book {
        uint isbn;
        string title; // 书名
        uint price;   // 价格
    }

    mapping(uint => Book) lib; // 从 ISBN 到 Book 的映射关系

    //其他特性
    //没有length
    //无法遍历
}