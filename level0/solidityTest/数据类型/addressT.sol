// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract addressTest{

    //普通地址类型（不可接收转账）
    address addr = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
    //可收款地址类型（可接收转账）
    address payable addr_pay = payable(0x8306300ffd616049FD7e4b0354a64Da835c1A81C);
    //EOA :外部账号（external owned address） CA:合约账号（contract address）
    // 当我们把 Ether 转进 EOA 账户后，只要我们控制了 EOA 的私钥，我们就可以把 Ether 再转出来。而在 CA 账户情况则大为不同。
    // CA 账户是由合约控制的，合约只能执行它定义过的操作。所以我们必须要在合约实现一个函数，定义好如何将账户下的 Ether 转出才行。
    // 否则这些 Ether 会被永远锁住在 CA 账户里面。
    // 因此每次要向 CA 账户转账的时候我们都必须问自己：这个合约有没有定义好了把 Ether 转出的逻辑。
    // 使用 address payable 就是明确告诉编译器你已经确认转账到这个地址是安全的。这提高了合约安全性，也更方便开发者进行 Debug。

    //类型转换
    // address payable 可隐式转换成addr
    address addr1 = addr_pay;
    // address 需要显式地使用payable()转换成address payable
    address payable addr_pay1 = payable(addr1);

    //成员变量
    //地址类型有三个成员变量
    //balance  :该地址的账号余额，单位为Wei
    //code：该地址的合约代码，EOA账号为空，CA账号为非空
    //codehash：该地址合约代码的哈希值
    function get_balence() public view returns(uint256){
        return address(this).balance;
    }
    function get_code() public view returns(bytes memory){
        return address(this).code;
    }
    function get_codehash() public view returns(bytes32){
        return address(this).codehash;
    }

    //成员函数
    //tranfer()：可以向指定地址转账
    //send(): 与tanfer()函数类似，但是如果转账失败会抛出异常
    //call();可以调用其他合约的函数
    //delegatecall();与call()函数类似，但是使用当前合约的上下文来调用其他合约中的函数
    //staticcall();与call()函数类似，但是不会允许有改变状态变量的操作
    //tranfer()和call()函数只能在address payable类型中使用
    
    
}