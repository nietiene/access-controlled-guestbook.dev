// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Profile {
   uint public  age;
   string public name;
   bool public isAcitve;
   address public wallet;

   constructor () {
    wallet = msg.sender;
    isAcitve = true;
   } 

   function setProfile (uint _age, string memory _name, bool _status) public {
    require(msg.sender == wallet, "Owner only allowed to update");
    age = _age;
    name = _name;
    isAcitve = _status;
   }

   function getProfile () public view returns (uint, string memory, bool, address) {
    return (age, name, isAcitve, wallet);
   }
}
