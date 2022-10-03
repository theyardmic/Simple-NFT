// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the OZ contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// GameItem follows ERC721 contract from openzeppelin
contract GameItem is ERC721 {

    constructor() ERC721("GameItem", "ITM") {
        // mint an NFT to yourself
        _mint(msg.sender, 1);
    }
}
