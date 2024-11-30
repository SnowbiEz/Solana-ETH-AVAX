# Tricot Contract

A Solidity contract for managing the sale and stock of mana potions, with built-in error handling using `require`, `assert`, and `revert` to ensure correct transactions and stock management.
t
## Description

The `tricotContract` contract allows users to purchase tricots, while the owner can manage the stock and pricing.

## Getting Started

### Installing

- Use Remix IDE or any Solidity-supported IDE to deploy and interact with the contract.

### Executing Program

1. Deploy the contract using the Remix IDE.
2. Use the `updateTricotPrice` function to update the price of tricot (owner only).
3. Use the `setTricotStockLimit` function to update the stock limit of tricot (owner only).
4. Use the `modifyTricotStock` function to increase or decrease the stock of tricot (owner only).
5. Use the `buyTricot` function to purchase Tricots by sending the appropriate amount of Wei.

### Ownership and Stock Management

- The contract owner can adjust tricot prices and stock limits.
- Users can purchase tricots as long as they do not exceed their ownership limit of 20 potions and also include the required amount of wei.

## Error Handling

This contract incorporates `require`, `assert`, and `revert` statements to safeguard against invalid transactions:

- `require`: Ensures sufficient Wei is sent for purchases, stock limits are not exceeded, and ownership limits are respected.
- `assert`: Used to ensure that stock levels do not go negative preventing underflow.
- `revert`: Used to prevent transactions that would exceed the user's potion ownership limit.

## Help

For troubleshooting, check Remix IDE for compilation errors, runtime issues, or gas limit problems.
