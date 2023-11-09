// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenWithOpenZeppelin is ERC20 {
    uint256 public constant PRICE_PER_TOKEN = 1 ether;

    constructor() ERC20("TokenWithOpenZeppelin", "TWZ") {}

    function buyTokens() external payable {
        require(
            msg.value % PRICE_PER_TOKEN == 0,
            "Must send multiples of price"
        );
        uint256 amountToBuy = msg.value / PRICE_PER_TOKEN;
        _mint(msg.sender, amountToBuy);
    }
}
