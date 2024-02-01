// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Contract {
    string public myString = "Hello World";
    uint public myUint = 7;

    function updateMyString (string memory _myString) public {
        myString = _myString;
    }
    function updateMyUint (uint _myUint) public {
        myUint = _myUint;
    }
    function incrementMyUint () public {
        myUint ++;
    }
    function decrementMyUint () public {
        myUint --;
    }

}