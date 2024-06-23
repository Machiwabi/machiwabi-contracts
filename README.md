# Machiwabi Conracts

To realize this project, we need to create smart contracts with the following key features. We will combine the functionality of ERC721 and ERC1155 extensions to implement a point system.

<img width="2249" alt="Frame 1" src="https://github.com/Machiwabi/machiwabi-contracts/assets/1862066/a250fe65-284c-4c88-b8a6-7b37bfa4aa66">


## MatiwabiToken721 - ERC721 Extension Smart Contract

- Minting Functionality:
  - Only the owner can mint new tokens.
  - Records the token ID and the current block number at the time of minting.

- Point Calculation Functionality:
  - Calculates points based on the number of blocks that have elapsed up to the specified block number.
  - Applies point boosts based on held ERC1155 tokens.

- MissionToken1155(ERC1155 Extension) Registration:
  - The owner can register an ERC1155 extension to be used in point calculations.

#### manta-sepolia-testnet
https://pacific-explorer.sepolia-testnet.manta.network/address/0x497b1B27540e4205B7315DEdF1B062CA4f5345cD

#### sepolia
https://sepolia.etherscan.io/address/0xE1C4FFf0B8FA1e078d253F43B8AC26aaA806d65b#code

## MissionToken1155 -  ERC1155 Extension Smart Contract

- Minting Functionality:
  - Mints new token IDs and records the holder's address and the current block number.

- ID Addition Functionality:
 - Sets URL, boost duration, cooldown time, and points per block for each token ID.
  - These settings can only be configured by the owner.

### testnet

#### manta-sepolia-testnet
https://pacific-explorer.sepolia-testnet.manta.network/address/0xf472fed0404F907dB77d3052f95ad75B317f3e07

#### sepolia
https://sepolia.etherscan.io/address/0xaf3E61dDa90956085060dce183dA0d928610D9B2
