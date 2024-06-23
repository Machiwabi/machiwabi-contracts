// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MissionToken1155 is ERC1155, ERC1155Supply,  Ownable {
    // Boost Information
    struct BoostInfo {
        string url;
        uint256 boostBlock;
        uint256 cooldownTime;
        uint256 pointsPerBlock;
    }
    
    // Mapping from token ID to boost information
    mapping(uint256 => BoostInfo) private _boostInfo;
    // Mapping from token ID to holder address to block number
    mapping(uint256 => mapping(address => uint256)) private _holderBlock;

    constructor(string memory initialUri, address owner) ERC1155(initialUri) Ownable(owner) {
    }

    function mint(address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(to, id, amount, data);
        _holderBlock[id][to] = block.number;
    }

    function setBoostInfo(uint256 id, string memory url, uint256 boostBlock, uint256 cooldownTime, uint256 pointsPerBlock) public onlyOwner {
        _boostInfo[id] = BoostInfo(url, boostBlock, cooldownTime, pointsPerBlock);
    }

    function calculateBoostPoints(address holder, uint256 targetBlock) public view returns (uint256) {
        uint256 totalBoostPoints = 0;

        for (uint256 id = 0; id < totalSupply(id); id++) {
            if (balanceOf(holder, id) > 0) {
                BoostInfo memory info = _boostInfo[id];
                uint256 holdingBlocks = targetBlock - _holderBlock[id][holder];
                if (holdingBlocks > info.boostBlock) {
                    totalBoostPoints += holdingBlocks * info.pointsPerBlock;
                }
            }
        }

        return totalBoostPoints;
    }

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Supply)
    {
        ERC1155._update(from, to, ids, values);
        ERC1155Supply._update(from, to, ids, values);
    }
}