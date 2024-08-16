// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract WETH {
    string public name = "Wrapped Ether";
    string public symbol = "WETH";
    uint8 public decimals = 18;
    event Approval(address indexed src, address indexed delegateAds, uint256 amount);
    event Transfer(address indexed src, address indexed toAds, uint256 amount);
    event Deposit(address indexed toAds, uint256 amount);
    event Withdraw(address indexed src, uint256 amount);
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    function deposit() public payable {
        //balanceOf当前地址的token数量
        //往当前地址存token
        balanceOf[msg.sender] += msg.value;
        //事件记录当前地址存放了多少token
        emit Deposit(msg.sender, msg.value);
    }
    function withdraw(uint256 amount) public {
        //当前地址的余额是否可用
        require(balanceOf[msg.sender] >= amount);
        //当前地址token减掉对应数量
        balanceOf[msg.sender] -= amount;
        //转账
        payable(msg.sender).transfer(amount);
        //事件记录当前地址取了多少
        emit Withdraw(msg.sender, amount);
    }
    function totalSupply() public view returns (uint256) {
        //查余额
        return address(this).balance;
    }
    function approve(address delegateAds, uint256 amount) public returns (bool) {
        //msg.sender 对应的 address 的余额
        allowance[msg.sender][delegateAds] = amount;
        //记录事件
        emit Approval(msg.sender, delegateAds, amount);
        return true;
    }
    function transfer(address toAds, uint256 amount) public returns (bool) {
        //写入函数，调用transferFrom给第一个地址赋值当前合约
        return transferFrom(msg.sender, toAds, amount);
    }
    function transferFrom(
        address src,
        address toAds,
        uint256 amount
    ) public returns (bool) {
        //余额是否够用
        require(balanceOf[src] >= amount);
        //不是发起者
        if (src != msg.sender) {
            //余额是否够用
            require(allowance[src][msg.sender] >= amount);
            //
            allowance[src][msg.sender] -= amount;
        }
        balanceOf[src] -= amount;
        balanceOf[toAds] += amount;
        emit Transfer(src, toAds, amount);
        return true;
    }
    fallback() external payable {
        deposit();
    }
    receive() external payable {
        deposit();
    }
}