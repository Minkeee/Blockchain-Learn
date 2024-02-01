// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract MappingExample {

    mapping (uint => bool) public uintToBool;
    mapping (address => uint) public myAddressInfo;
    mapping (address => string) public favoriteWord;
    mapping (address => mapping (uint => uint)) public valueSent;
    mapping (address => uint) public deposits;

    function MyUintToBool (uint _myUint) public {
        uintToBool[_myUint] = true;
    }

    function SetMyAddress () public {
        myAddressInfo[msg.sender] = msg.sender.balance;
    }

    function SetDepositInfo (uint _setIndex) public payable {
        valueSent[msg.sender][_setIndex] = msg.value;
    }
    function setMyFavorite (string memory _myFavoriteWord) public {
        favoriteWord[msg.sender] = _myFavoriteWord;
    }
    function deposit () public payable {
        deposits[msg.sender] += msg.value;
    }

    function checkBalanceInfo () public view returns (uint) {
        return address(this).balance;
    }

    function withdrawal () public payable{
        uint balanceToSend = deposits[msg.sender];
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(balanceToSend);
    }

}