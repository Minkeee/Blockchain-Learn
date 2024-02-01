// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract SampleMsg {

    uint public myUint;
    string public myString;

    function UpdateMyString (string memory _myString) public payable {
        myString = _myString;
    }

    function UpdateMyUint (uint _myUint) public payable {
        if (msg.value == 2 ether) {
            myUint = _myUint;
            //1 ether = 1^18 wei
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}