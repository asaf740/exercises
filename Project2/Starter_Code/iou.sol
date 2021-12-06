// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract IOU {
   
    
    mapping(address => mapping(address => uint)) public splits;

    
    constructor() {
    }
    
    function addSplit(address creditor, uint amount) public {
        require(
            msg.sender != creditor,
            "You cannot owe to yourself"
        );
        splits[msg.sender][creditor] += amount;
    }
    
    function getSplit(address a, address b) public view
            returns(uint)
    {   
        return splits[a][b];
    }    
}
