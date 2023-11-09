// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TokenWithOpenZeppelin.sol";
import "../src/TokenWithoutOpenZeppelin.sol";

contract OpenZeppelinComparisonTest is Test {
    TokenWithOpenZeppelin tokenWithOZ;
    TokenWithoutOpenZeppelin tokenWithoutOZ;

    function setUp() public {
        tokenWithOZ = new TokenWithOpenZeppelin();
        tokenWithoutOZ = new TokenWithoutOpenZeppelin();
    }

    function testTokenWithOpenZeppelinGas() public {
        uint256 gasBefore = gasleft();
        address(tokenWithOZ).call{value: 1 ether}(
            abi.encodeWithSignature("buyTokens()")
        );
        uint256 gasAfter = gasleft();
        emit log_named_uint("Gas used with OpenZeppelin", gasBefore - gasAfter);
    }

    function testTokenWithoutOpenZeppelinGas() public {
        uint256 gasBefore = gasleft();
        address(tokenWithoutOZ).call{value: 1 ether}(
            abi.encodeWithSignature("buyTokens()")
        );
        uint256 gasAfter = gasleft();
        emit log_named_uint("Gas used without OpenZeppelin", gasBefore - gasAfter);
    }
}
