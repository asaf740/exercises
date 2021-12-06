// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract IOU {
   
    struct Split {
        address sender;
        address receiver;
        uint amount;
    }

    mapping(address => mapping(address => int)) public splits;

    
    constructor() {
    }
    
    function addSplit(address creditor, int amount) public {
        require(
            msg.sender != creditor,
            "You cannot owe to yourself"
        );
        require(
            amount > 0,
            "You cannot owe negative number"
        );
        address lower = msg.sender;
        address higher = creditor;
        if ( lower > higher )
        {
            lower = creditor;
            higher= msg.sender;
        }
        splits[lower][higher] += amount;
    }
    
    function getSplit(address a, address b) public view
            returns(int)
    {
        address lower = a;
        address higher = b;
        if ( lower > higher )
        {
            lower = b;
            higher= a;
        }
        return splits[lower][higher];
    }    
}
