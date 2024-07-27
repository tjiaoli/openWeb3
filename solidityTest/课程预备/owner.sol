// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Owner{

    //结构体
    //结构体是一种数据类型，用于表示多个字段的集合。结构体可以被用来定义复杂的数据类型。
    struct Identity{
        address addr;
        string name;
    }
    //枚举
    //枚举是一种数据类型，用于定义一组名称和整数值之间的对应关系。枚举可以让代码更具可读性和可维护性
    enum State{
        HasOwner,
        NoOwner
    }

    //事件 
    //事件是一种特殊函数，可以用来记录合约执行过程中发生的重要事件。可以认为事件就是Solidity的log。你可以通过已连接的客户端访问这些事件
    //当owner被设置成新的owner时触发
    event OwnerSet(address indexed oldOwnerAddr,address indexed newOwnerAddr);
    //当owner被删除时触发
    event OwnerRemoved(address indexed  oldOwnerAddr);

    //函数修饰器
    //函数修饰器可以被用来修饰函数的行为。
    //只允许合约owner调用被它修饰的函数
    modifier isOwner(){
        require(msg.sender == owner.addr,"Caller is not owner");
        _;
    }


    //状态变量
    //状态变量是用于存储合约状态的变量。状态变量会被永久保存在区块链上，并且可以在合约执行期间被读写。
    Identity private owner; //一个Indentity类型的变量，表示合约的owner
    State private state;    // 一个state类型的变量，表示合约的当前状态


    //函数
    //函数是一组逻辑代码，定义合约可以执行的操作。它可以接受参数，并根据参数计算返回结果。函数可以被其他合约调用。
    //构造函数
    constructor(string memory name){
        owner.addr = msg.sender;
        owner.name = name;
        state = State.HasOwner;
        emit OwnerSet(address(0),owner.addr);
    }

    //普通函数
    function changeOwner(address addr,string calldata name)public isOwner{
        owner.addr = msg.sender;
        owner.name = name;
        emit OwnerSet(owner.addr, addr);
    }

    //普通函数
    function removeOwner() public isOwner{
        emit OwnerRemoved(owner.addr);
        delete owner;
        state = State.NoOwner;
    }

    //普通函数
    function getOwner() external view returns (address,string memory){
        return (owner.addr,owner.name);
    }

    //普通函数
    function getState() external view returns (State){
        return state;
    }


}