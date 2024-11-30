// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TricotShop {
    uint public tricotPrice = 10 wei;
    uint public tricotStock = 500;
    uint public tricotStockLimit = 1000;
    address public owner;
    mapping(address => uint) public tricotOwned;
    uint public tricotOwnedLimit = 20;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function updateTricotPrice(uint _newPrice) public onlyOwner {
        require(_newPrice > 0, "Price must be greater than 0");
        tricotPrice = _newPrice;
    }

    function updateTricotStockLimit(uint _newLimit) public onlyOwner {
        require(_newLimit >= tricotStock, "New limit cannot be lower than current stock");
        tricotStockLimit = _newLimit;
    }

    function modifyTricotStock(int _quantity) public onlyOwner {
        if (_quantity > 0) {
            require(tricotStock + uint(_quantity) <= tricotStockLimit, "Exceeds stock limit");
            tricotStock += uint(_quantity);
        } else {
            uint quantityToRemove = uint(-_quantity);
            assert(tricotStock >= quantityToRemove); // Ensures no underflow
            tricotStock -= quantityToRemove;
        }
    }

    function buyTricot(uint _quantity) external payable {
        require(msg.value >= _quantity * tricotPrice, "Insufficient payment");
        require(_quantity > 0, "Must purchase at least 1 Tricot");
        require(_quantity <= tricotStock, "Not enough stock available");

        if (tricotOwned[msg.sender] + _quantity > tricotOwnedLimit) {
            revert("Owned limit exceeded");
        }

        tricotStock -= _quantity;
        tricotOwned[msg.sender] += _quantity;
    }
}
