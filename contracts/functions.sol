// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// function is used to store / retrieve / update data
// also is used to intract with another contract, executes bussiness logic

// function visibility tells someone who will call the function
// 1. public: anyone can call the function
// usecase: function needed to be called by the user like transfer of depost

contract MyContract {
    uint public  myNumber;

    function setNum(uint _num) public {
          myNumber = _num;
    }

// 2. private: can only be called within the same contract not visible to child contract

    uint private  secret = 45;

// create private function to return our secret number
    function getSecretNumber() private view returns (uint) {
      return  secret;
   }

// becuse privste function can not be called directly we create public function to call private function 
// this private function is used for sensitive information
   function revealPrivateNumber() public  view returns (uint) {
    return getSecretNumber();
   }


   // 3. internal: similar to private but child contract can access it
   // it is applied in token standard like ERC20, reusable base contract
   // also in access control system 
   uint internal parentNumer = 20;

   function setParentNumber(uint _num) internal {
    parentNumer = _num;
   }

   // 4. external is called only from outside of the contract
   // it is aplied in calling external message like user wallet, another contract ..
 // it is used in gas efficirent for large amount of input
   uint public num = 3;

   function setNumber(uint _num) external {
    num = _num;
   } 

   function getNumber(uint _num) public {
    // this refer to current address
    // it helps to call external function 
     this.setNumber(_num);
   } 

   function getnum() public view returns (uint) {
    return num;
   }

// function modifiers it describes how function intract with the blockchain state
// 1. view it is used to read state variables but can not modify them it is off-chain
// applicaton: reading balances, metadata, status

// 2. pure: only deals with function inputs or local variables no read of data or modify them

function add(uint a, uint b) public pure returns (uint) {
    return  a * b;
}

}

/// child contract
contract Child is MyContract {
    function updateParentNum (uint _num) public {
       setParentNumber(_num);
    }

    function getParentNum () public  view  returns (uint) {
        return  parentNumer;
    }
}



