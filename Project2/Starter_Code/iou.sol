// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract IOU {
   
    struct Split {
        address sender;
        address receiver;
        uint amount;
    }

    Split[] public splits;

    
    constructor() {
    }
    
    function addSplit(address creditor, uint amount) public {
        require(
            msg.sender != creditor,
            "You cannot owe to yourself"
        );
        splits.push( Split( {
            sender : msg.sender,
            receiver : creditor,
            amount : amount
        }));
    }
    
    function getSplits() public view
            returns (Split [] memory)
    {
        return splits;
    }    
}
