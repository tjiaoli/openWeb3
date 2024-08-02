// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract visibility{

    //可见性
    //solidity的可见性指其他合约对当前合约的中的变量和函数的可访问性(accessiblility).
    //四种修饰符 public private internal external 
    //public 当前合约内部和外部访问
    //private 只能当前合约内部访问
    //internal 当前合约内部或其子合约中访问
    //external 只能当前合约外部访问
    //变量可以用的可见性修饰符是 public private internal ，函数全部可用
    uint varPrivate;
    uint varInternal;
    uint varPublic;

    function funcPrivate() private {}
    function funcInternal() internal {}
    function funcExternal() external pure returns (uint){
        uint a = 100;
        return a;
    }
    function funcPublic() public  returns (uint){
        funcInternal();
        funcPrivate();
        return this.funcExternal();
    }
}


contract child is visibility{
    function funcChild() private  {
        funcInternal(); // 子合约可以访问主合约中可见性为internal，public的函数
        funcPublic(); // 子合约可以访问主合约中可见性为internal，public的函数
    }
}


contract ThirdPartyContract {
      function funcThirdParty(address mainContractAddress) private {
            visibility(mainContractAddress).funcExternal(); // 第三方合约可以访问主合约中可见性为external，public的函数
            visibility(mainContractAddress).funcPublic(); // 第三方合约可以访问主合约中可见性为external，public的函数
      }
}
