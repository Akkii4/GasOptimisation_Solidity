// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
// Reading & doing operation on a memory variables(cache) is cheaper when compared to that from storage variable(non cache)

//NOTE: Caching is not always true, ever since EIP-2929 the first SLOAD operation costs 2100 gas, 
// but once that memory is read, it is cached and considered considered warm, which has a cost of 100 gas to load again.
// It would still save gas to load and retrieve that variable in memory, especially if read more than twice.
contract GasSaveCaching {
    uint public num = 50;

    // for num = 50 , it takes 47605 gas
    function noCache() public view returns(uint256 op) {
        for (uint i = 0; i < num; i++) {
            op += 1;
        }
    }

    // for num = 50 , it takes 42588 gas
    function cache() public view returns(uint256 op) {
        uint _num = num;
        for (uint i = 0; i < _num; i++) {
            op += 1;
        }
    }
}
