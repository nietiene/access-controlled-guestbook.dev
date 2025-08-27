// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
// modifier are reusable piece of code that can change behavior of the function
// usercase: RBAC, input validation, check codde before running them
// syntax
// modifier modifierName {
// some logic
// _; codes before _ runs before function runs, codes after _ runs after function runs
// }
contract ModifierExample {
    // 1. RBAC: for this example only contract owner should call function named setData
  address public owner;

    constructor() {
        owner = msg.sender;
    }
     modifier onlyOwner {
        require(msg.sender == owner, "Only owner allowed");
        _;
     }

     string public data;
     function setData (string memory _data) public onlyOwner {
         data = _data;
     }

uint public balance;
    modifier validateAmount {
        require(balance > 0, "Amount must be greater than 0");
        _;
    } 

    function deposit (uint _balance) public validateAmount {
        // deposit logic
    }
} 