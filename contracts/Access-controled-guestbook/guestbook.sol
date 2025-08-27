// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
// Goal: Users can write a message, but only allowed addresses can post.
// Modifiers: Restrict posting to certain users or roles.
// Events: Emit an event every time someone posts a message so the frontend can display it in real time.
contract GuestBook {
    address public owner;
    mapping (address => bool) public allowedUsers;

   struct Message {
      address sender;
      string content;
      uint timestamp;
   }

   Message[] public messages;

   event newMessage(address indexed sender, string content, uint timestamp);

constructor () {
    owner = msg.sender;
}
modifier onlyOwner {
    require(msg.sender == owner, "Only owner allowed");
    _;
}

modifier allowedUser {
    require(allowedUsers[msg.sender], "You are not allowed");
    _;
}

function addAllowedUser (address _user) public onlyOwner {
    allowedUsers[_user] = true;
}

function removeAllowedUser (address _user) public onlyOwner {
    allowedUsers[_user] = false;
}


function postMessage (string memory _content) public allowedUser {
    require(bytes(_content).length > 0, "Message can't be empty");
    messages.push(Message(msg.sender, _content, block.timestamp));

  emit newMessage(msg.sender, _content, block.timestamp);
}

function getTotalMessage() public view returns (uint) {
    return messages.length;
}

function getMessage (uint _index) public view returns(address, string memory, uint) {
    require(_index < messages.length,  "Please Enter valid index");
   Message storage msgObj = messages[_index];
   return (msgObj.sender, msgObj.content, msgObj.timestamp);
} 
}