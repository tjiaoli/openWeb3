// SPDX-License-Identifier: MIT 
pragma solidity >=0.4.22; 

//允许合约找到我们将在自己的合约中使用的ERC20合约定义。
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

contract ERC20MinerReward is ERC20 { 
    //定义LogNewAlert事件
    event LogNewAlert(string description, address indexed _from, uint256 _n); 
    //使用符号MRW定义一个名为MinerReward的新ERC20代币
    constructor() ERC20("MinerReward", "MRW") {} 

    function _reward() public {   
        //矿工block.coinbase会因为挖掘该区块获得20个MRW代币    
        _mint(block.coinbase, 20); 
        emit LogNewAlert('_rewarded', block.coinbase, block.number); 
    } 
} 