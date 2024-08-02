// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";

contract array{

    event Log(uint);
    event Log(uint[]);
    event Log(uint[2][3]);
    event Log(uint[][]);
    uint[] arr3;
    uint[][] arrS;
    function arrayT()public{
                uint n = 2;
                uint[2] memory arr = [uint(1000),10001];
                arr[0] = 33;
                uint[] memory arr1 = new uint[](n);
                arr1[0] = 1999;
                arr1[1] = 1222;
                emit Log(arr[0]);
                emit Log(arr1[0]);


                //数组成员
                //成员变量 数组只有一个成员变量，就是length
                uint arrLen = arr.length;
                emit  Log(arrLen);
                //动态数组成员函数
                //只有动态数组，并且其数据位置为storage的时候才有成员函数。
                //这三个成员函数会改变数组的长度。它们分别是：
                //push() 在末尾加一个元素，并赋于零值，数组长度加一
                //push(x) 在末尾加一个元素，赋值x，数组长度加一
                //pop() 从数组末尾弹出一个元素；数组长度减一
                emit Log(arr3);
                arr3.push();
                emit Log(arr3[0]);
                arr3.push(1);
                emit Log(arr3[1]);
                arr3.pop();
                emit Log(arr3);
                // emit  Log(arr3.length);
                // uint[3] memory arr4;
                // arr4.push(1); //编译错误，只有 storage 上的动态数组才能调用 push 函数
                // arr4.pop(); // 编译错误，只有 storage 上的动态数组才能调用 pop 函数
                // uint[] memory arr5 = new uint[](3);
                // arr5.push(1); //编译错误，只有 storage 上的动态数组才能调用 push 函数
                // arr5.pop(); // 编译错误，只有 storage 上的动态数组才能调用 pop 函数


                //多维数组
                uint[3] memory cryptoPunk = [uint(2),1002,1003];
                uint[5] memory boredApe = [uint(1),1002,1003,2001,9999];
                console.log(cryptoPunk[1]+boredApe[1]);
                //多维数组声明
                //T[col][row] DataLocation arrName;
                //DataLocation 数据位置，arrName 数组名，row 和col代表数组的行和列，此处与java相反
                //solidity的多维数组是从右往左看， 例如uint[3][5]代表5行3个元素，uint[2][3][5]代表5个uint[2][3]数组。

                //声明静态多维数组
                uint[2][3] memory arrm;
                //静态多维数组的初始化
                //零值初始化, arrm //所有元素为0
                emit Log(arrm);
                //多维数组字面值初始化静态多维数组
                // 编译报错，类型不匹配，1会被隐式转化成uint16,同时 静态多维数组其中元素数量需要与定义匹配
                // uint[3][2] memory arr = [[1, 2, 3], [uint(4), 5, 6]]; 
                arrm = [[uint(1),8],[uint(1),5],[uint(1),4]];
                emit  Log(arrm);

                //声明动态多维数组
                uint[][] memory arrM;//行列数任意的动态多维数组
                uint[][3] memory arrM3;//行数为3，列任意的动态多维数组
                //动态多维数组初始化
                //动态多维数组初始化需要用到new关键字。
                uint n1 = 3;
                uint m = 2;
                emit Log(arrS);
                for(uint i =0;i<n1;i++){
                    arrS.push(new uint[](m));
                }
                arrS[2][1] = 3;
                emit Log(arrS);
               

    } 
     //当多维动态数组中有一个是静态对应的元素同样遵循，只有动态数组，并且其数据位置为storage的时候才有成员函数。
        uint[][3] storageArr;
        uint[1][] storageArr1;
        uint[][] storageArr2 = [[uint(1), 2], [uint(3), 4]]; // 动态数组只有在storage位置才能用数组字面值初始化

        function invalidPush() public {
            uint k = 2;
            // storageArr.push(new uint[](k)); // 编译错误
            // storageArr1.push(new uint[]()); // 编译错误
        }
        function validPush() public {
            storageArr[0].push(999); // 合法

            //多维下标访问，
            //下标访问与声明是反的！与大多数语言是一样的。从左往右
            storageArr2[0][1] = 5;
            uint arr2 = storageArr2[0][1];
            emit Log(storageArr2);
            emit Log(arr2);
        }

        

}