// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TestToen {
    mapping (address => uint256) public lastClaimed;
    uint256 constant public CLAIM_AMOUNT = 100;
    uint256 constant public COOLDOWN = 1 days;

    event TokenEvent(address indexed user, uint256 amount, uint256 time);

    modifier oncePerDay {
        require(block.timestamp >= lastClaimed[msg.sender] + COOLDOWN, "Claim only once per day");
        _;
    }

    function Claim () external oncePerDay {
        lastClaimed[msg.sender] = block.timestamp;

        emit TokenEvent(msg.sender, CLAIM_AMOUNT, block.timestamp);
    }
}