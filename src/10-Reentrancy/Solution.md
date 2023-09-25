-   Follow CHECKS, EFFECTS, INTERACTIONS(CEI)

```solidity
function withdraw(uint256 _amount) public {
    if (balances[msg.sender] >= _amount) {
        balances[msg.sender] -= _amount;
        (bool result,) = msg.sender.call{value: _amount}("");
        if (!result) {
            revert()
        }
    }
}
```
