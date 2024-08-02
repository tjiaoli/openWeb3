// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24 <0.9.0;

import "./fristApp.sol";//测试引用结构体

contract importTodos{
    
     //fristApp.sol中声明的
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

/**
Data Locations
Data Locations - Storage, Memory and Calldata //数据存放地址 
Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
//变量被声明为这些位置以明确指定数据的位置
storage variable is a state variable (store on blockchain)
memory variable is in memory and it exists while a function is being called
calldata special data location that contains function arguments
storage （数据会被存储在链上，是永久记录的，其生命周期与合约生命周期一致）
memory （数据存储在内存，是易失的，其生命周期与函数调用生命周期一致，函数调用结束数据就消失了）
calldata （与memory类似，数据会被存在一个专门存放函数参数的地方，与memory不同的是calldata数据是不可更改的。另外相比于memory，它消耗更少的Gas）
*/

contract DataLocations {

    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        uint fo1 = myStruct.foo;
        console.log(fo1);
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
        uint fo2 = myMemStruct.foo;
        console.log(fo2);
    }

    function _f(uint256[] storage _arr,mapping(uint256 => address) storage _map,MyStruct storage _myStruct) internal {
        // do something with storage variables
        address a = _map[1];
        console.log(a);
        _arr[0] = 122;
        MyStruct storage myStruct = _myStruct;
        myStruct.foo = _arr[0];
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }
}

/**
Function
There are several ways to return outputs from a function.

Public functions cannot accept certain data types as inputs or outputs

在Solidity中，函数可以返回多种不同类型的输出，并且有几种方法可以返回这些输出。此外，某些数据类型无法作为输入或输出被传递给公共函数。
*/
contract Function {

    // Functions can return multiple values. //方法可以返回多个值
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // Return values can be named.返回值可以命名
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // Return values can be assigned to their name. 返回值可以分配给他们的名称
    // In this case the return statement can be omitted. 这种情况下可以忽略return
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values. 调用返回多个值的函数的时候可以结构赋值
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // Values can be left out. 值可以省略
        (uint256 x,, uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output //映射不能用于输入输出 数组可以

    // Can use array for input
    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output
    uint256[] public arr;

    function arrayOutput(uint256[] memory arr1) public pure returns (uint256[] memory) {
        return arr1;
    }
}

// Call function with key-value inputs 通过key-value调用函数

contract XYZ {
    event Log(address);
    //给传参命名
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public  returns (uint256) {
        if(b){
            return x+y+z;
        }else{
            c = unicode"失败";
            emit  Log(a);
            return z;
        }
    }

    function callFunc() external returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    //使用命名参数调用，增加可读性，灵活性不用按顺序，当参数比较多的情况下减少出错的风险
    function callFuncWithKeyValue() external returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}

/**
View and Pure Functions
Getter functions can be declared view or pure.

View function declares that no state will be changed. //view不能修改任何状态

Pure function declares that no state variable will be changed or read. //pure不能更改和读写任何状态
*/

contract ViewAndPure {
    uint256 public x = 1;

    // Promise not to modify the state.
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        // i = x;不能读
        return i + j;
    }
}

/**
Error
An error will undo all changes made to the state during a transaction.
错误将撤销在交易期间对状态做的所有的更改
You can throw an error by calling require, revert or assert.
你能通过调用require，revert，assert抛出一个异常
require is used to validate inputs and conditions before execution.
用于在执行前验证输入和条件
revert is similar to require. See the code below for details.
可以直接抛出异常
assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.
assert 用于检查永远不应该为假的代码。断言失败可能意味着存在错误
Use custom error to save gas.
*/

contract Error {
    function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs 输入
        // - conditions before execution 执行前的条件
        // - return values from calls to other functions 来自其他函数调用的返回值
        require(_i > 10, "Input must be greater than 10"); //输入参数判断
    }

    function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex. //当条件比较复杂用 revert很有用
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        // Assert should only be used to test for internal errors, 
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 0);
    }

    // custom error 自定义错误
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;//初始化值为0
        if (bal < _withdrawAmount) {
            //错误信息会返回 InsufficientBalance函数 parameters信息
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}

contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = 2 ** 256 - 1;

    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;

        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);//多用于结束？
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}


/**
Function Modifier 函数修饰
Modifiers are code that can be run before and / or after a function call.
修饰符 是函数被调用逻辑之前 或之后运行的代码 多函数可复用的代码
Modifiers can be used to:

Restrict access 限制访问
Validate inputs 验证输入
Guard against reentrancy hack 防止冲入攻击
*/
contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract. 将交易发送人定义为合约所有者
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of 修饰符 检测这个调用人是不是合约所有者
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the 
    // address passed in is not the zero address. 判断地址不是空地址
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner)
        public
        onlyOwner //判断发送者是否为合约所有者
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    // 修饰符可以在函数之前和/或之后调用。
    // 这个修饰符防止一个函数在其仍在执行时被调用。
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}


/**
Events
Events allow logging to the Ethereum blockchain. Some use cases for events are:
时间允许将日志记录到以太坊区块链。事件一些是使用场景
Listening for events and updating user interface 监听事件并更新用户界面
A cheap form of storage 一种简单的存储形式
事件可以写在合约外
*/
contract Event {
    // Event declaration 事件声明
    // Up to 3 parameters can be indexed. 最多引用三个参数
    // Indexed parameters helps you filter the logs by the indexed parameter 
    //索引参数帮助你通过索引参数过滤日志
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}

/**
Constructor
A constructor is an optional function that is executed upon contract creation.
构造函数时一个可选的函数 在合约创建时执行 通常用于初始化合约状态或执行一次性设置
Here are examples of how to pass arguments to constructors.

*/

// Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.
//两种方式初始化父合约参数
// Pass the parameters here in the inheritance list. 在继承列表中传递
contract B is X("Input to X"), Y("Input to Y") {

    function parent() public view returns(string memory){
        return text;
    }
}

contract C is X, Y {
    // Pass the parameters here in the constructor,
    // similar to function modifiers.在构造函数中传参类似修饰符
    constructor(string memory _name, string memory _text) X("33") Y(_text) {
        name = _name;
    }

}

// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor(string memory _text) X("X was called") Y("Y was called") {
        name = _text;
    }
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor(string memory _name) Y("Y was called") X("X was called") {
        name = _name;
    }
}