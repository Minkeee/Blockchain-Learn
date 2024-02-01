// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract StructExample {

    struct MakeAnOrder {
        address from;
        string beans;
        uint quantity;
    }

    MakeAnOrder public Order;

    function buySomeCoffee (string memory _beans, uint _quantity) public payable {
        Order = MakeAnOrder(msg.sender, _beans, _quantity);
    }
}