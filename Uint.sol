// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract UintLearn {
    string public Product;
    uint public Value;
    uint public TotalCost;

    function buyProduct (uint _value, string memory _product, uint _quantity) public {
        Value = _value;
        Product = _product;
        uint Cost = _value * _quantity;
        uint discount = Cost * 17 /100;
        TotalCost = Cost - discount;
    }
}