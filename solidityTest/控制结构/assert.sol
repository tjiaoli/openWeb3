// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract assertTest{
    //Solidity提供的 assert 函数让我们可以检查合约状态是否正常，否则抛出异常。
    //，如果其结果是 false 那么就会抛出异常。然后所有状态变量都会恢复原状。
    function splitEther(address payable addr1,address payable  addr2) public payable {
            require(msg.value%2 == 0,"Even value required");//检查传入的ehter是不是偶数，不是回滚
            uint balanceBeforeTransfer = address(this).balance;
            addr1.transfer(msg.value/2);
            addr2.transfer(msg.value/2);
            //检查分账后本合约的balance不受影响
            assert(address(this).balance == balanceBeforeTransfer);
    }
}