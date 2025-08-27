// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// mapping is used to map key to their  value pair
// keys are unique
// syntax: mapping(keyType, keyValue) public myMapping;

contract myMapping {
    mapping (address => uint) public balance;

    function setBalance(uint _balance) public {
        // sets the address of calling the function to balance passed while running this function
        balance[msg.sender] = _balance;
       // msg.sender is key , balance is value
    }

// this function take any address as input and return balance of that address
    function getBalance (address _user) public view returns (uint) {
      return balance[_user];
    }

    //nested mapping means mapping inside another mapping
    // it is used to store complex key and value relationship 
    // usecase: token contract, voting system, game inventories

// address is outer map and uint->tokenId and uint->balance is inner map
    mapping (address => mapping (uint => uint)) public balances;

    function setBalances (uint tokenId, uint _balances) public {
        balances[msg.sender][tokenId] = _balances; 
    }

    function getBalances (address _user, uint tokenId) public view returns (uint) {
        return balances[_user][tokenId];
    }


}