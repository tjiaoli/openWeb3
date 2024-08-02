// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//receive函数
contract Callee{

    //receive 函数是 Solidity 中的一种特殊函数，它主要被用来接收 Ether 转账。
    //另外还有一个 fallback 函数也可以用来接收 Ether 转账，下一节我们会介绍。
    /**!!!要注意 Ether 转账和 ERC20 代币转账的区别!!!
        Ether 转账时所转的是原生代币（native token）。
        而 ERC20 所定义的都是非原生代币（non-native token）。
        ERC20 代币内部实现类似于一个数据库，里面记录了每个持有者持有了多少个代币。
        ERC20 代币转账调用的都是普通函数。跟 Ether 转账是有本质不同的。*/

        //receive函数定义，固定格式 不需要function 前缀，可见性（external）外部调用，状态可变性 state mutability (payable)接受转账
               
        receive() external payable { }//放开后Caller 的转账请求可以成功 接收纯转账？


        event FooCalled();

        // foo 函数
        function foo() external payable {
            emit FooCalled();
        }

}

contract Caller {
    address payable callee;

    // 注意： 记得在部署的时候给 Caller 合约转账一些 Wei，比如 100 
    /** 1 wei: 最小单位
        1 gwei = 1,000,000,000 wei
        1 szabo = 1,000,000,000,000 wei
        1 finney = 1,000,000,000,000,000 wei
        1 ether = 1,000,000,000,000,000,000 wei*/
        // 值后面不加单位默认是 wei
    constructor() payable{
        require(msg.value >= 1 , "Initial funding is required");
        callee = payable(address(new Callee()));

    }

    // 注释掉 callee中的 recive 或 fallback 会失败，因为Callee既没有定义receive函数，也没有定义fallback函数 
    function tryTransfer() external {
        callee.transfer(1);
    }

    // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
    function trySend() external {
        bool success = callee.send(1);
        require(success, "Failed to send Ether");
    }

    // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
    function tryCall() external {

        (bool success,) = callee.call{value: 1}("");
        require(success, "Failed to send Ether");
    }

    // 用于查看 Caller 合约的余额
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }



    /**我们提到如果合约既没有定义 receive 函数，也没有定义 fallback 函数，
    那么对其转账会失败。但是在同等情况下，不影响普通函数调用（msg.data != empty）。
    例如你可以用 call 来调用普通函数*/
    function tryCall1() external {
        
        // 调用 foo() 函数 
        (bool success,) = callee.call( abi.encodeWithSignature("foo()") );
         require(success, "Call to foo() failed");
    }

    function tryCall2() external payable {
        require(msg.value == 1, "Must send 1 wei");
        // 调用 foo() 函数，并转账 1 Wei 
        (bool success,) = callee.call{value: 1}( abi.encodeWithSignature("foo()") );
        require(success, "Call to foo() with value failed");
    }


    //gas不足问题
    //三种转账方式：send()  gas固定2300，返回布尔值
    //transfer() gas固定2300，错误时revert
    //call{value:amount}("") gas可以随意设定，返回布尔值
    //send 和 transfer 的gas时固定的 尽量不要在内部进行操作 如 
    // 修改状态变量
    // 创建合约
    // 调用其他相对复杂的函数
    // 发送 Ether 到其他账户
    // 示例 Example
    // 可以进行emit 记录输出
    
}



// 用send,transfer函数转账到该合约都会被 revert
// 原因是消耗的 Gas 超过了 2300
contract Example {
    uint a;
    receive() external payable {
        a += 1;
    }
}

