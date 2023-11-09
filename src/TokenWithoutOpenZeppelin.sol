// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TokenWithoutOpenZeppelin {
    uint256 public constant PRICE_PER_TOKEN = 1 ether;
    mapping(address => uint256) public balances;

    string public name = "TokenWithoutOpenZeppelin";
    string public symbol = "TWZ";
    uint256 public totalSupply;

    function buyTokens() external payable {
        require(
            msg.value % PRICE_PER_TOKEN == 0,
            "Must send multiples of price"
        );
        uint256 amountToBuy = msg.value / PRICE_PER_TOKEN;
        balances[msg.sender] += amountToBuy;
        totalSupply += amountToBuy;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
