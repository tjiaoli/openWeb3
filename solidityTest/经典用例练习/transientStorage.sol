// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24 <0.9.0;

// Make sure EVM version and VM set to Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call
// Transient storage - data is cleared out after a transaction

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}

contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        /**
        assembly {} 是 Solidity 中用于编写内联汇编的语法。
        它允许你直接使用底层 EVM 汇编语言，提供更高的控制权和更高的执行效率。
        */
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    // 清除临时存储槽的函数
    function _clearStorage() internal {
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 存储到临时存储槽的函数
    function _setStorage(uint256 value) internal {
        assembly {
            tstore(SLOT, value)
        }
    }

    // 读取临时存储槽的函数
    function _loadStorage() internal view returns (uint256 value) {
        assembly {
            value := tload(SLOT)
        }
    }

    // 锁定修改器
    modifier lock() {
        // 检查锁状态
        if (_loadStorage() != 0) {
            revert("ReentrancyGuard: reentrant call");
        }

        // 设置锁
        _setStorage(1);
        _;

        // 清除锁
        _clearStorage();
    }

    // 示例函数，演示锁的使用
    function test() external lock {
        // 忽略调用错误
        bytes memory b = "";
        (bool success, ) = msg.sender.call(b);
        require(success, "Call failed");
    }
}