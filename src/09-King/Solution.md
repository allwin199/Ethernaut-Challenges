-   Attack contract sent some ether higher than the prize and claims the throne

-   But it dosen't have a `receive()` or `fallback()`

-   Now whenever some other contract tries to claim the throne

-   New balance has to be sent to the previous king

-   Since the previous king dosen't have `receive()` or `fallback()` new balance cannot be sent to the previous king

-   This creates DOS(Denial of Service)

-   To avoid DOS

-   Instead of sending the ether, make the previous king to withdraw
