// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract exampleBool {

    bool public myBool;
    address public owner;
    bytes public myBytes = "Hello World";
    address public myAddress;
    uint public myUint;

    constructor () {
        owner = msg.sender;
    }

    function setMyBool (bool _myBool) public {
        myBool = _myBool;
    }
    // view vs pure

    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }

    function viewFunction () public view returns (uint) {
        return myUint;
    }

    function pureFunction (uint balance, uint quantity) public pure returns (uint) {
        return balance + quantity;
    }

    // function setMyAdress (address _myAddress) public {
    //     myAddress = _myAddress;
    // }
    // we can use msg.sender to set myAddress
    function setMyAddress () public {
        myAddress = msg.sender;
    }

    function AddressBalance () public view returns (uint) {
        return myAddress.balance;
        //1 Eth = 1^18 wei
    }


}