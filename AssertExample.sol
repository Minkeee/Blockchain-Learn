// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract AssertExample {

    mapping (address => uint) BalanceReceieved;

    function deposit () public payable {
        assert(msg.value == uint8 (msg.value));
        BalanceReceieved[msg.sender] += uint8 (msg.value);
    }

    function CheckBalance () public view returns (uint) {
        return address(this).balance;
    }

    function withdraw (address payable _to, uint8 _amount) public {
        require (_amount <= BalanceReceieved[msg.sender], "Sorry, you have not enough fund.");
        BalanceReceieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}