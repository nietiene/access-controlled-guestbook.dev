// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract BankApp {
    uint private  secret = 123;
    uint public balance = 0;

    function deposit(uint amount) public {
        balance  += amount;
    }

    function doubleSecret () private view returns (uint) {
        return  secret * 2;
    } 

    function updateBalance (uint _newBalance) internal {
        balance = _newBalance;
    }

    function withdraw (uint _amount) external {
        require(balance >= _amount, "Balance not enough");
        balance -= _amount;
    }


    function getBalance () public view returns (uint) {
        return  balance;
    }

}