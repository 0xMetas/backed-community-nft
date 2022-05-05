// SPDX-License-Identifier: APGL-3.0-only
pragma solidity 0.8.13;

interface IRenderer {
    function tokenURI(uint256 id) external view returns (string memory);
}
