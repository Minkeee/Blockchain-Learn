// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract MappingAndStruct {

    struct Transaction {
        uint Amount;
        uint TimeStamp;
    }

    struct Record {
        uint TotalDeposit;
        uint NumDeposit;
        mapping (uint => Transaction) deposit;
        uint numWithdrawal;
        mapping (uint => Transaction) withdrawal;
    }

    mapping (address => Record) public Balances;

    function DepositMoney () public payable {
        Balances[msg.sender].TotalDeposit += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        Balances[msg.sender].deposit[Balances[msg.sender].NumDeposit] = deposit;
        Balances[msg.sender].NumDeposit ++;
    }

    function checkBalancesSC () public view returns (uint) {
        return address(this).balance;
    }

    function getDepositDetails (address _from, uint _num) public view returns (Transaction memory) {
        return Balances[_from].deposit[_num];
    }

    function WithdrawalMoney (address payable _to, uint _amount) public payable {
        Balances[msg.sender].TotalDeposit -= _amount;
        Transaction memory withdrawals = Transaction (_amount, block.timestamp);
        Balances[msg.sender].withdrawal[Balances[msg.sender].numWithdrawal] = withdrawals;
        Balances[msg.sender].numWithdrawal ++;
        _to.transfer(_amount);
    }

    function getWithdrawalDetails (address _from, uint _num) public view returns (Transaction memory) {
        return Balances[_from].withdrawal[_num];
    }

}