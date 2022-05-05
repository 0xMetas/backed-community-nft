// SPDX-License-Identifier: APGL-3.0-only
pragma solidity 0.8.13;

import {ERC721Soulbound} from "./ERC721Soulbound.sol";
import {IRenderer} from "./interfaces/IRenderer.sol";

/// @title Backed Protocol Community NFT
/// @author 0xMetas
contract BackedCommunity is ERC721Soulbound {
    // --------- //
    // [ state ] //
    // --------- //
    address public renderer;

    // --------------- //
    // [ constructor ] //
    // --------------- //
    constructor() ERC721Soulbound("BackedCommunity", "BACKED") {}

    // ------------ //
    // [ metadata ] //
    // ------------ //
    function tokenURI(uint256 id_)
        public
        view
        override
        returns (string memory)
    {
        if (renderer != address(0)) {
            return IRenderer(renderer).tokenURI(id_);
        }
        return "{}";
    }
}
