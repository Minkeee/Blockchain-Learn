// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract ExampleRequire {

    string errorMassage = "Not enough fund";

    mapping (address => uint) deposit; 

    function depositMoney () public payable {
        deposit[msg.sender] += msg.value;
    }

    function withdrawalUsingIfElse(address payable _to, uint _amount) public { 
        // we can use if else statement
        // if we try to withdraw the money more than what we have, the transaction went through but the ballance will still... 
        if (_amount <= deposit[msg.sender]) {
            deposit[msg.sender] -= _amount;
            _to.transfer(_amount);
        } 
    }

    function checkBalance () public view returns (uint) {
        return address(this).balance;
    }

    function withdrawalUsingRequire (address payable _to, uint _amount) public {
        //if we use require statement, it will give error massage...
        require(_amount <= deposit[msg.sender], "Not enough fund");
        deposit[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}

