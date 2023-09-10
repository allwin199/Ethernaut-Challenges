-   Generating random numbers in solidity can be tricky. There currently isn't a native way to generate them, and everything you use in smart contracts is publicly visible, including the local variables and state variables marked as private. Miners also have control over things like blockhashes, timestamps, and whether to include certain transactions - which allows them to bias these values in their favor.

-   To get cryptographically proven random numbers, you can use Chainlink VRF, which uses an oracle, the LINK token, and an on-chain contract to verify that the number is truly random.

-   Some other options include using Bitcoin block headers (verified through BTC Relay), RANDAO, or Oraclize).
