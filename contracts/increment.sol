// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract myCounter {
     uint public count;

     function increment () public {
          count += 1;
     }

     function decrement () public {
        require(count > 0, "Count cannot be negative");
        count -= 1;
     }

     function setCount (uint _count) public {
        count = _count;
     }

     function getCount () public  view  returns (uint) {
        return  count;
     }

}