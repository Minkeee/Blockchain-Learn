// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Wallet1 {
    mapping (address => uint) public BalanceReceieved;

    function deposit () public payable {
        BalanceReceieved[msg.sender] += msg.value;
    }

    // receive() external payable {
    //     deposit();
    //  }
}

contract Wallet2 {
    receive () external payable {}

    function sendingMoneyToWallet1 (address _toWallet1) public {
        // we can use this 
        // (bool success, ) = _toWallet1.call {value: 1, gas: 100000} ("");
        // require (success);
        //note : wallet1 must have recieve function, so the transaction went through
        
        // use this
        // Wallet1 wallet = Wallet1(_toWallet1);
        // wallet.deposit{value: 10, gas:100000}();

        // or use this
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _toWallet1.call{value: 10, gas: 100000} (payload);
        require (success);

    }
}