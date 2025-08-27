// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Arrays are collection of elements with the same type
// usercase: store token holders, list of NFT owners, tracks multiple deposit per user
contract Arrays {
    uint[3] public  numbers;

    function setNumber () public {
        numbers[0] = 30;
        numbers[1] = 40;
        numbers[2] = 50;
    } 

function getNumber () public view  returns (uint) {  
  return (numbers[0]);

}


// Dynamic Array

uint[] public nums;

function setNum(uint _num) public {
     nums.push(_num);
}

function getNum(uint index) public view returns (uint) {
    return nums[index];
}

function removeLast() public {
    nums.pop();
}

function getLength() public view returns (uint) {
    return nums.length;
}
}