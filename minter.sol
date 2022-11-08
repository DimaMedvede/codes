// SPDX-License-Identifier: MIT

pragma solidity ^0.8;


import "./ExoGirls.sol";
import "./IERC721Receiver.sol" ;


contract Minter2 is IERC721Receiver {

    uint public NFTprice = 0 ;
    uint public quantity = 2 ;
    ExoGirls public target = ExoGirls(0x19992A68E3ec95F8BEd13ACd746f6260f56fE4f8);


    receive() external payable{}

    constructor() payable {
        target.mint{value: NFTprice}(quantity);
    }

    function transfetNFTs(uint256[] calldata tokenId, address to) public {
        for (uint i; i < tokenId.length; ++i) {
            target.transferFrom(address(this), to, tokenId[i]);
        }
    }

    function onERC721Received(address, address, uint256, bytes calldata) public virtual override returns(bytes4) {
        return this.onERC721Received.selector;
    }

}
