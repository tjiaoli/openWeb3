// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

//字面值（运算结束之前的值）
contract Literal{

    event Log(string);
    event Log(address);
    function literal() public{
        //地址字面值
        address addr = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
        emit Log(addr);
        //有理数和整数字面值
        uint256 a = 123;
        uint256 b = .1+1.9;
        uint256 c = 0xff;
        a = c+b;
        int256 d = 2e10;
        int256 e = -2e10;

        d = e;
        //1000_00 的_仅仅是用来修饰
        //有理数和整数字面值可以是任意精度
        uint256 p = (2**800+1) - 2**800;//2**800已经超过uint256表示范围，但是运算结果等于1 p=1;

        //运算中有非字面值不行，如下
        uint256 f = 1;
        //uint256 g = 2.5 + a + 0.5;//编译报错，+a的时候前面的值编译器会尝试转化成uint256
        //uint256 i = a + 2.5 + 0.5;
        //另一种情况 根据计算顺序前面的结果是整数
        uint256 h = 2.5 + .5 + a;
    
        p = f + h;
        //字符串字面值
        string memory s1 = "This is a string";
        string memory s2 = 'This is a string';
        s2 = s1;
        //字符串隐式转换 bytes1.。。。 string
        bytes1 b1 = "b";
        bytes2 b2 = "b2";
        bytes3 b3 = "b3";
        bytes32 b32 = "b32";
        string memory str = "string";

        b1 = bytes1(b2);
        b32 = bytes32(b3);
        emit Log(str);
        //字符串字面值还支持以下转译字符
            // \<newline> (字符串字面值可以横跨多行)
            // \\ (反斜杠)
            // \' (单引号)
            // \" (双引号)
            // \n (新行)
            // \r (回车)
            // \t (tab)
            // \xNN (十六进制表示字符)
            // \uNNNN (unicode表示字符)
            // 这些转义字符可以和其他字符混合使用，例如 ”\’hello world\’” 
            string memory t = unicode"Hello \u0041 你好，😃";
            emit Log(t);
    }
}