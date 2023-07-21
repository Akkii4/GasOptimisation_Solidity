pragma solidity ^0.8.0;

// Using Assembly code to save on 256bit Hashing in EVM
contract HashContract {
    // 1234 gas
    function hash(uint _a, uint _b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }

    // 846 gas
    function hashOptimised(uint _a, uint _b) public pure returns (bytes32) {
        bytes32 result;
        assembly {
            let input := mload(0x40)
            mstore(input, _a)
            mstore(add(input, 0x20), _b)
            result := keccak256(input, 0x40)
        }
        return result;
    }
}
