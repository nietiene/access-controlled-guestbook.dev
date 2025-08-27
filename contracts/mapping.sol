// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// mapping is used to map key to their  value pair
// keys are unique
// syntax: mapping(keyType, keyValue) public myMapping;

contract myMapping {
    mapping (address => uint) public balance;

    function setBalance(uint _balance) public {
        balance[msg.sender] = _balance;
       // msg.sender is key , balance is value
    }

    function getBalance (address _user) public view returns (uint) {
      return balance[_user];
    }
}