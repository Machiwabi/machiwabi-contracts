# Machiwabi Conracts

To realize this project, we need to create smart contracts with the following key features. We will combine the functionality of ERC721 and ERC1155 extensions to implement a point system.

## MatiwabiToken721 - ERC721 Extension Smart Contract

- Minting Functionality:
  - Only the owner can mint new tokens.
  - Records the token ID and the current block number at the time of minting.

- Point Calculation Functionality:
  - Calculates points based on the number of blocks that have elapsed up to the specified block number.
  - Applies point boosts based on held ERC1155 tokens.

- MissionToken1155(ERC1155 Extension) Registration:
  - The owner can register an ERC1155 extension to be used in point calculations.

## MissionToken1155 -  ERC1155 Extension Smart Contract

- Minting Functionality:
  - Mints new token IDs and records the holder's address and the current block number.

- ID Addition Functionality:
 - Sets URL, boost duration, cooldown time, and points per block for each token ID.
  - These settings can only be configured by the owner.

#### testnet
https://sepolia.etherscan.io/address/0xaf3E61dDa90956085060dce183dA0d928610D9B2
