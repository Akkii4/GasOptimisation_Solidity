// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SingleLineSwap {
    uint256 public a = 1;
    uint256 public b = 2;

    //gas: 31293
    function traditionalSwap() external  {
        uint256 temp = a;
        a = b;
        b = temp;
    }
    
    // Single line swap without use of temp variable
    //gas: 31252
    function destructuringSwap() external  {
        (a, b) = (b, a);
    }
}
