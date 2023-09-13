-   Contract `Delegation` has a `fallback()`

-   This `fallback()` is using the delegate call

```js
await contract.sendTransaction({ data: "0xdd365b8b" });
```

-   `0xdd365b8b` is the function selector for "pwn()"
-   It can be derived using `abi.encodeWithSignature("pwn()")`

-   When we send a transaction with a function that is not present in the contract, `fallback()` will be called.
-   The `fallback()` function in Solidity is called when none of the other functions in the contract match the function signature of the incoming transaction.

-   By using the function signature `pwn()` can be called in `Delegate` contract.

-   Delegate Contract and Delegation has the same storage structure.
-   By using this, `owner` can be claimed in the Delegation.
