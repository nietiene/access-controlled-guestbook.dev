// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract myContract {
    // uint
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

    //string
    string public myText;

   // memory exist only during function exections means is temporary variable
    function setText (string memory _text) public {
         myText = _text;
    } 

    function getText () public view  returns (string memory) {
        return myText;
    }

    //bool
    bool public isActive;

    function Activate () public {
        isActive = true;
    }
    function deActivate () public {
        isActive = false;
    }

    function getStatus () public view returns (bool) {
       return  isActive;
    }

  // address datatype to store ethereum address wallet
   address public owner;

// constructor is special function that runs once when contract is deployed
// how it works: it runs when contract is deployed and initialize current address to the owner
   constructor () {
    // msg.sender means the account address of someone who is deploying the account
     owner = msg.sender; // the onwer whom deploys the contract
   }

   function changeOwner (address _newOwner) public {
    require(msg.sender == owner, "Only owner allowed to change");
    owner = _newOwner;
   }

   function getOwner () public  view  returns (address) {
    return owner;
   }

}