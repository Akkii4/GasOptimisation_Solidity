// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

/**
* Solidity has code size limit of 24576 bytes(24 Kb) thus one way is to reduce modifier to internal function
* CodeSize can be computed by determining the length of the contract bytecode
*/

// bytecode length 750
contract NormalCode {
    uint public num = 50;

    modifier validNum {
        require(msg.value == num);
        _;
    }

    function test1() public validNum payable {
        //logic
    }

    function test2() public validNum payable {
        //logic
    }

    function test3() public validNum payable {
        //logic
    }

    function test4() public validNum payable {
        //logic
    }

    /** here above functions compiles like :
        function test() public payable {
            require(msg.value == num);      // Modifier copy and paste it's code into all the functions that are accessing that modifier.
            //logic
        }
    */
}

// bytecode length 670 
contract ReducedCodeSize {
    uint public num = 50;

    function _validNum() private view {
        require(msg.value == num);
    }

    modifier validNum {
        _validNum();
        _;
    }

    
    function test1() public validNum payable {        
        //logic
    }

    function test2() public validNum payable {
        //logic
    }

    function test3() public validNum payable {
        //logic
    }

    function test4() public validNum payable {
        //logic
    }

    /** here above functions compiles like :
        function test() public payable {
            _validNum();        // code is not copied but it instead makes the internal call.
            //logic
        }
    */
}
