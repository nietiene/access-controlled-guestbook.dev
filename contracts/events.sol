// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
// events: is way to make your contract connect to extrenal world like frontend
// are stored in ethereum logs it listens to that event and know what happens 
// syntax: event eventName(type indexed param1, type param2)
// indexed make searchable in logs useful for flitering

contract EventExample {
    // decrale event named userRegistres
    // becuase user is indexed means it will placed in the log topic and make it easily filtred
    event UserRegistred(address indexed user, string name);

// custom data type in solidty lets you groud mulitiple datatype to the same object
    struct User {
        address wallet;
        string name;
    }

// map address with struct means we'll access users by entering their address and display their name and address
mapping (address => User) public users;


function registerUser(string memory _name) public {
    // return name value into bytes and check its length
    require(bytes(_name).length > 0, "Name required");

// store user in struct to user users
    users[msg.sender] = User(msg.sender, _name);

// emit events so the frontend can see
    emit UserRegistred(msg.sender, _name);
}
}


// usercase: frontend and dApps, token transfer, NFTs, oracle or external services