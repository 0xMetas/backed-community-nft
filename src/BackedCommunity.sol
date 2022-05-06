// SPDX-License-Identifier: APGL-3.0-only
pragma solidity 0.8.13;

import {Initializable} from "openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {ERC721SoulboundUpgradeable} from "./ERC721SoulboundUpgradeable.sol";
import {BackedCommunityStorageV1} from "./BackedCommunityStorage.sol";
import {IRenderer} from "./interfaces/IRenderer.sol";

/// @title Backed Protocol Community NFT
/// @author 0xMetas
contract BackedCommunity is
    Initializable,
    ERC721SoulboundUpgradeable,
    BackedCommunityStorageV1
{
    // --------------- //
    // [ constructor ] //
    // --------------- //
    function initialize() public initializer {
        __ERC721Soulbound_init("BackedCommunity", "BACKED");
    }

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
