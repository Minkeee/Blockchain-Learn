// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract FallbackExample {

    string public lastRecieve;
    uint public lastValueRecieve;
    string public myString;

    //recieve and fallback is low level interaction.
    //recieve and fallback just up to 2300 gas.

    receive() external payable {
        lastRecieve = "It's Recieve";
        lastValueRecieve = msg.value;
     }
     //recieve function will error if we called with data in there.
     //we can use it if there is no data in there.

     fallback () external payable {
        lastRecieve = "It's Fallback";
        lastValueRecieve = msg.value;
     }
     //fallback function will not get error if we call it with any data or no data in there.
}