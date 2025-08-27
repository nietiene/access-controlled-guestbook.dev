// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Mapping {
    // address to store list of users
    address[] public userList;
    // map create balance variable which will store addres's balance
    mapping (address => uint) public balance;

    function addUser(uint _balance) public {
        // check if address balance is 0 if true means user is new add them on the list of users and his balance
        // else change his balance to new balance
        if (balance[msg.sender] == 0){
           userList.push(msg.sender);
        }
        balance[msg.sender] = _balance;
    }

// get total list of user in the blockchain
    function getTotolaUser () public view returns (uint) {
        return userList.length;
    }
}
