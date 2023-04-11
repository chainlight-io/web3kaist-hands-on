// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/SafeVault.sol";
import "../src/Attacker.sol";

interface ISafeVault {
    function balance(address) external view returns (uint256);
    function withdrawAll(address) external;
    function deposit() external payable;
    function transfer(address, uint256) external;
}

contract ReentrancyAttacker {
    receive() external payable {
        // Write your own code.
        // You have 10 deposit balance.
        // Be careful that the target (vulnerable) contract has 10_020 ethereum total.
    }
}

contract IntegerOverUnderflowAttacker {
    receive() external payable {}

    function integerOverUnderflowAttackHandler(address vault) external {
        // Write your own code.
        // You have 10 deposit balance.
        // Be careful that the target (vulnerable) contract has 10_020 ethereum total.
    }
}
