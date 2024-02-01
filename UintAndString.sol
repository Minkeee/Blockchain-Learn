// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract UintAndString {

    string public posting;
    uint public Posted;

    function Update (string memory _tweet) public {
        posting = _tweet;
        Posted ++;
    }
    function deleteTheLastPost () public {
        Posted --;
    }
}

