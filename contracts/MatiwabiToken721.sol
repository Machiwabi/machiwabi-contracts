// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Interface for MissionToken1155
interface IMissionToken1155 {
    function calculateBoostPoints(address holder, uint256 targetBlock) external view returns (uint256);
}

contract MatiwabiToken721 is ERC721Enumerable, Ownable {
    struct TokenInfo {
        uint256 mintBlock;
    }
    
    mapping(uint256 => TokenInfo) private _tokenInfo;
    address public erc1155Contract;
    uint256 public constant POINTS_PER_BLOCK = 10;

    constructor(address owner) ERC721("MatiwabiToken721", "EWP") Ownable(owner) {}

    function mint(address to, uint256 tokenId) external onlyOwner {
        _safeMint(to, tokenId);
        _tokenInfo[tokenId] = TokenInfo(block.number);
    }

    function setERC1155Contract(address _erc1155Contract) external onlyOwner {
        erc1155Contract = _erc1155Contract;
    }

    function calculatePoints(uint256 tokenId, uint256 targetBlock) public view returns (uint256) {
        require(targetBlock >= _tokenInfo[tokenId].mintBlock, "ERC721WithPoints: invalid target block");

        uint256 basePoints = (targetBlock - _tokenInfo[tokenId].mintBlock) * POINTS_PER_BLOCK;

        // ブーストポイントを計算
        uint256 boostPoints = 0;
        if (erc1155Contract != address(0)) {
            boostPoints = IMissionToken1155(erc1155Contract).calculateBoostPoints(msg.sender, targetBlock);
        }

        return basePoints + boostPoints;
    }
}
