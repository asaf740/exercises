// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract IOU {
   
    struct AddressPair {
        address from;
        address to;
    }
    mapping(address => mapping(address => uint)) public splits;

    
    constructor() {
    }
    
    function addSplit(address creditor, uint amount, uint relax_amount, AddressPair [] calldata circle) public {
        require(
            msg.sender != creditor,
            "You cannot owe to yourself"
        );
        splits[msg.sender][creditor] += amount;

        for ( uint i = 0 ; i < circle.length; i++ ) {
            splits[circle[i].from][circle[i].to] -= relax_amount;
        }
    }
    
    function getSplit(address a, address b) public view
            returns(uint)
    {   
        return splits[a][b];
    }    
}
