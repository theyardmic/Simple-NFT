// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameAsset is ERC1155, Ownable {
    mapping (uint256 => address) private _owners;
    
    constructor(string memory uri) ERC1155(uri) {
    }
    
    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }
    
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override {
        require(_owners[id] == from, "ERC1155: caller is not the owner");
        _safeTransferFrom(from, to, id, amount, data);
        _owners[id] = to;
    }
    
    function mint(address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(to, id, amount, data);
        _owners[id] = to;
    }
}



