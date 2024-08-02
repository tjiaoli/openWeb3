// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

/**状态可变性*/
contract stateMutabilityModifier{
    //修饰函数用来限制合约中的函数的操作
    //三种状态可变性修饰符:pure view payable
    //view :只读不写，只能查看合约状态不能更改
    //pure :既不能查询，也不能修改合约状态。只能使用函数参数进行简单计算并返回结果
    //payable :允许函数接受Ether转账。函数默认是不能接受转账的，如果你需要接受转账，那必须指定其为payable


    //如何才算查询合约状态 solidity定义了5种
    //1.读取状态变量
    //2.访问address(this).balance 或者 <address>.balance 地址余额？
    //3.访问 block（区块信息），tx（交易信息），msg（与当前调用相关的信息）的成员
    //4.调用未标记未pure的任何函数
    //5.使用包含某些操作码的内联汇编

    //如何才算修改合约状态
    //1.修改状态变量
    //2.触发事件
    //3.创建其他合约
    //4.使用selfdestruct来销毁合约
    //5.通过函数调用发送以太币
    //6.调用未标注为view和pure的任何函数
    //7.使用低级别调用，如transfer，send，call，delegatecall等
    //8.使用包含某些操作码的内联汇编


    //如果函数承诺不修改合约状态，那你应该给他加上view修饰符
    
    uint count;
    function GetCount() public view returns(uint) {
        return count;
    }

    //如果你的函数承诺不需要查询，也不需要修改合约状态，那么你应该为它加上 pure 修饰符。
    //被标记为 pure 的函数，如果你在函数体查询或者修改合约状态，编译器都会直接报错。
    function add(uint lhs, uint rhs) public pure returns(uint) {
        return lhs + rhs;
    }

}