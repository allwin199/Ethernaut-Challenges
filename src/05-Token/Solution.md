```solidity
    function transfer(address _to, uint _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }
```

-   since `Token` contract is using `^0.6.0` there is a chance of overflow and undeflow.

-   Every Player is given 20 tokens

-   Now when a player try to give 21 tokens to someone, overflow occurs

-   `require(balances[msg.sender] - _value >= 0)` (20 - 21) since it is `uint` it will underflow

-   `balances[msg.sender] -= _value` because of undeflow `Player` will have huge balance
