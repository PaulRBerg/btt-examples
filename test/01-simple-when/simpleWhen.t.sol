// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import { BaseTest } from "../Base.t.sol";

contract SimpleWhenTest is BaseTest {
    function test_RevertWhen_XIsFalse() external {
        vm.expectRevert("x must not be false");
        foo.simpleWhen({ x: false });
    }

    function test_WhenXIsTrue() external {
        bool returnedValue = foo.simpleWhen({ x: true });
        assertTrue(returnedValue);
    }
}
