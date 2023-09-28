// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21 <0.9.0;

import { PRBTest } from "@prb/test/PRBTest.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

import { Foo } from "../src/Foo.sol";

contract BaseTest is PRBTest, StdCheats {
    Foo internal foo;

    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        foo = new Foo();
    }
}
