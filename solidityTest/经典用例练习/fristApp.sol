// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24 <0.9.0;

import "hardhat/console.sol";

//简单的加减计算
contract Counter {

    uint256 public count;

    function get() public view returns(uint256){
        return count;
    }

    function inc() public  {
        count += 1;
    }

    function dec() public {
        count -= 1;
    }
}

//Primitive Data Types 原始数据类型
contract PrimitiveDataTypes{

    bool public boo = true;

   /*取值区间
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint256 public u2 = 256; 
    uint public u256 = 256;//uint 就是uint256
    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256
    
    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
    int8 public i8 = 8;

    int256 public i2 = 2 ** 255 - 1;

    int public i256 = -2 ** 127; //int 就是int256

    int public minInt = type(int).min;
    uint public maxUint = type(uint).max;

    function compare()public view returns(bool){
        if(minInt==(-2 ** 127)&&maxUint==(2 ** 256 - 1)){
            return boo;
        }
        return false;
    }
    
    //地址
    address public  addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*字节数组
    In Solidity, the data type byte represent a sequence of bytes. 
    Solidity presents two type of bytes types :

     - fixed-sized byte arrays//静态字节数据
     - dynamically-sized byte arrays.//动态字节数据
     
     The term bytes in Solidity represents a dynamic array of bytes. 
     It’s a shorthand for byte[] . //用bytes表示是byte[]的缩写 bytes
    */

    bytes1 by1 = 0x64;
    bytes2 by2 = 0x6464;
    bytes2 by2_2 = '22';
    bytes3 by3 = 'abc';
    bytes4 by4 = "abcd";

    //Unassigned variables have a default value 未赋值的变量有一个默认值
    bool public defaultBoo; //false
    uint256 public defalutUint;//0
    int256 public defalutInt;//0
    address public deflutAddress;//0x0000000000000000000000000000000000000000

    
}

//variables there are 3 types of variables in solidity 三种类型的变量
    /**
        local //局部变量
            declared inside a function //在函数内声明
            not stored on the blockchain //不存储在区块链上
        state   //状态变量
            declared outside a function //在函数外声明
            stored on the blockchain    //存储在区块链上
        global (provides information about the blockchain) //全局变量（提供关于区块链的信息）
    */

contract Variables {
    // State variables are stored on the blockchain. //状态变量 存储在区块链上
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public view{
        // Local variables are not saved to the blockchain. // 局部变量 不存储在区块链上
        uint256 i = 456;
        i = 22;
        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp 取当前区块链时间戳
        address sender = msg.sender; // address of the caller   调用者地址
        console.log(timestamp);
        console.log(sender);
    }
}

// constant 常量 
// 固定值不可修改 节省gas
contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;
}

//immutable 与 constant 类似, 区别是除了在声明的时候初始化还能在构建函数的时候初始化 之后不可修改
contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS = 0x1111111111111111111111111111111111111111;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
        MY_UINT = 1;
    }
}

/**
Reading and Writing to a State Variable //读写 一个状态变量
To write or update a state variable you need to send a transaction. //写和更新状态变量需要发送一笔交易

On the other hand, you can read state variables, for free, without any transaction fee.//另一方面，你可以免费读取状态变量，而无需任何交易费用
*/

contract SimpleStorage {
    // State variable to store a number //存储一个数据类型的状态变量
    uint256 public num;

    // You need to send a transaction to write to a state variable. //你需要发送一笔交易才能写入状态变量
    function set(uint256 _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.//你能读取状态变量而无需发送一笔交易
    function get() public view returns (uint256) {
        return num;
    }
}

/**
Ether and Wei //以太币和Wei
Transactions are paid with ether. 类似美元和美分

Similar to how one dollar is equal to 100 cent, one ether is equal to 10(18) wei. 1 ether = 10的18次幂 wei
*/

contract EtherUnits {
    uint256 public oneWei = 1 wei;
    // 1 wei is equal to 1  //不带单位的数字默认单位是wei
    bool public isOneWei = (oneWei == 1);

    uint256 public oneGwei = 1 gwei;
    // 1 gwei is equal to 10^9 gwei
    bool public isOneGwei = (oneGwei == 1e9);

    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = (oneEther == 1e18);
}

//Gas 
/**
How much ether do you need to pay for a transaction? //你需要支付多少以太币进行一笔交易
You pay gas spent * gas price amount of ether, where//你支付以太币的数量却决于 gas的量*gas的价格

gas is a unit of computation //gas是一个计量单位 computation 计算量
gas spent is the total amount of gas used in a transaction //gas 花费 就是 交易中总的gas数
gas price is how much ether you are willing to pay per gas //gas price 就是你愿意支付的每单位gas的ether数
Transactions with higher gas price have higher priority to be included in a block. // gas价格较高的交易会被优先包含在区块中

Unspent gas will be refunded.// 没有被花费的gas 会被退回

Gas Limit //gas 限制
There are 2 upper bounds to the amount of gas you can spend  //你能花费的gas有两个上线

gas limit (max amount of gas you're willing to use for your transaction, set by you) //gas限制（你愿意为交易使用的最大gas数量，由你设置）
block gas limit (max amount of gas allowed in a block, set by the network)//区块链 gas限制（区块链中允许的最大gas数量，由区块链设置）
*/

contract Gas {
    uint256 public i = 0;
    // Using up all of the gas that you send causes your transaction to fail.//消耗了所有发送的gas，你的交易会失败
    // State changes are undone.//状态改变将撤销
    // Gas spent are not refunded.//消耗的gas不会退回
    function forever() public {
        // Here we run a loop until all of the gas are spent 循环直到所有gas被退回
        // and the transaction fails 然后交易报错
        while (true) {
            i += 1;
        }
    }
}

//if/Else
contract IfElse {

    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        // the "?" operator is called the ternary operator //简短逻辑简单的if/else可以用 三目运算符
        return _x < 10 ? 1 : 2;
    }
}

//循环
/**
Solidity supports for, while, and do while loops.

Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.
For the reason above, while and do while loops are rarely used.
不要编写没有界限的循环，这样可能会达到gas的上线使你的交易失败
由此原因，很少使用 while和do while
*/


contract Loop {
    function loop() public pure{
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue// 跳过本轮
                continue;
            }
            if (i == 5) {
                // Exit loop with break //结束循环
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}


/**
Mapping
映射
Maps are created with the syntax mapping(keyType => valueType).
映射是使用语法mapping(keyType => valueType);创建的
The keyType can be any built-in value type, bytes, string, or any contract.
keyType 可以是任何内置类型，字节，字符串或任何合约
valueType can be any type including another mapping or an array.
valueType 可以是 任何类型，包括另一个映射或数组
Mappings are not iterable.
映射不能被迭代 不能被循环 只能通过对应键来访问
*/

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        /*当你访问映射中的一个键时，即使这个键没有被显式地设置过，映射也会返回一个默认值。
        对于数值类型，这个默认值是 0；对于布尔类型，这个默认值是 false；对于引用类型，这个默认值是 0x0 或 null。*/
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        // Update the value at this address 赋值
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default value. //重置为默认值 此时通过地址取到的值是默认值
        delete myMap[_addr];
    }
}

//嵌套映射 
contract NestedMapping {
    // Nested mapping (mapping from address to another mapping) //嵌套映射 （映射从一个地址 到 另一个映射）
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized //可以从嵌套映射中取值即使它没有初始化。此处返回false
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint256 _i, bool _boo) public {
        nested[_addr1][_i] = _boo; //给嵌套映射对应的映射对应的valueKey的valueType赋值
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i]; //给嵌套映射对应的映射对应的valueKey的valueType恢复默认值
    }
}

/**
Array 数组
Array can have a compile-time fixed size or a dynamic size. 数组能在编译时 确定是 静态还是动态
*/

contract Array {
    // Several ways to initialize an array //几种初始化方式
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0 固定大小数据初始化后所有元素为0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i]; //空会报错
    }

    // Solidity can return the entire array. //solidity 可以返回数组
    // But this function should be avoided for //但是对于长度可以无限增长的数组应避免使用这种函数
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        // Append to array
        // This will increase the array length by 1.   向数组中添加元素，这将使数组长度增加1
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1  将数组最后一个元素踢出，这将使数组长度减1
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length; //获取数组长度
    }

    function remove(uint256 index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0 //delete 只会重置对应元素成默认值
        delete arr[index];
    }

    function examples() external pure{
        // create array in memory, only fixed size can be created 在 memory 内存中创建数组，只能是固定大小的数组
        uint256[] memory a = new uint256[](5);
        console.log(a[1]);
    }
}

/**
Examples of removing array element
Remove array element by shifting elements from right to left  移除数组的例子 通过将数据元组从右向左移动来实现
*/

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound"); //参数>= arr.length; 抛出异常回滚
        //向前赋值
        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        //踢出最后一个元组
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        //assert 条件不符抛出异常
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}

/**Remove array element by copying last element into to the place to remove 
    另一种方法，将被移除元素与最后一个元素互换，在不考虑数组元素顺序的情况下更高效 减少了循环*/

    contract ArrayReplaceFromEnd {
    uint256[] public arr;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last element into the place to delete.
    function remove(uint256 index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}

/**
Enum
Solidity supports enumerables and they are useful to model choice and keep track of state.
Enums can be declared outside of a contract. //solidity 支持枚举 ，它对于建模选择和跟踪状态非常有用。
枚举可以在合约外部声明
*/

contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    mapping(Status => uint) public statusValues;

    constructor() {
        // 显式设置枚举成员的值
        statusValues[Status.Pending] = 5;
        statusValues[Status.Shipped] = 10;
        statusValues[Status.Accepted] = 15;
        statusValues[Status.Rejected] = 20;
        statusValues[Status.Canceled] = 25;
    }
    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint //solidity 枚举会设默认值 隐式整数值从0递增
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;//此时会返回枚举的第一个成员值 也就是0
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status; 
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {//重置为0
        delete status;
    }


    
}

/**
Structs //结构体
You can define your own type by creating a struct. //你可以通过创建结构体定义自己的类型
They are useful for grouping together related data. //用作将相关的数据分组非常有用
Structs can be declared outside of a contract and imported in another contract.//结构体能在合约外声明 并且被其他合约导入
*/

 struct Todo {
        string text;
        bool completed;
    }

contract Todos {

    // An array of 'Todo' structs 声明一个结构体数组
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct //三种初始化方式
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false //bool初始值为false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint256 _index) public view returns (string memory text, bool completed){
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}