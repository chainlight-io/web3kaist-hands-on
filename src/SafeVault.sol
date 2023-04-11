// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract SafeVault {
    mapping(address => uint256) public balance;

    function withdrawAll(address to) external {
        require(balance[msg.sender] > 0, "Not enough user balance.");

        (bool success,) = payable(to).call{value: balance[msg.sender]}(hex"");
        require(success, "withdraw error");

        balance[msg.sender] = 0;
    }

    function transfer(address to, uint256 amount) external {
        unchecked {
            require(balance[msg.sender] - amount >= 0, "Not enough user balance.");

            balance[msg.sender] -= amount;
            balance[to] += amount;
        }
    }

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }
}
