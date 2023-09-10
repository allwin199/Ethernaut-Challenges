```solidity
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
```

-   The above code can be exploited.
-   When called using some contract `tx.origin` will be that contract's address and not the `msg.sender`
