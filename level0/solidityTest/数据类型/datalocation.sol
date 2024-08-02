// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//数据位置
contract datalocation{
    //storage变量必须是合约级声明，作为状态变量存在，并在多个函数调用之间共享和持久化
    string public name;

    //memory可以用于任何函数的声明函数

    //calldata只能用于函数的声明参数不能用于变量？因为不能修改？
    //返回值可以用memory但是不能用calldata
    //calldata是最便宜的存储位置，花费gas最少
    
    function useCalldata(string calldata call)external returns (string memory){
        name = call;
        // call = name ;编译会报错 calldata 不能被修改
        return name;
    }


}