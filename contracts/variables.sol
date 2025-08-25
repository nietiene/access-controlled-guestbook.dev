// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract myContract {
    uint public  myNumber;

    function setNumber (uint _num) public  {
        // _num is name of parameter you'll pass while calling setNumber 
        myNumber = _num;
        // store _num value to our state variable 
    }

    function getNumber () public  view returns (uint) {
        //view means function does not change the blockchain state
        // it means only read data from the contract
        // returns (uint) tells the compile what type of data type it will return
        return  myNumber;
    }
}