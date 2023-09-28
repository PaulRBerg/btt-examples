// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import { BaseTest } from "../Base.t.sol";

contract GivenWhenTest is BaseTest {
    function test_RevertGiven_ValueIsLessThan100() external {
        foo.setValue({ newValue: 42 });
        vm.expectRevert("value must not be less than 100");
        foo.givenWhen({ x: true });
    }

    modifier givenValueIsNotLessThan100() {
        foo.setValue({ newValue: 1337 });
        _;
    }

    function test_RevertWhen_XIsFalse() external givenValueIsNotLessThan100 {
        vm.expectRevert("x must not be false");
        foo.givenWhen({ x: false });
    }

    function test_WhenXIsTrue() external givenValueIsNotLessThan100 {
        foo.setValue({ newValue: 1337 });
        (uint256 returnedValue0, bool returnedValue1) = foo.givenWhen({ x: true });
        assertEq(returnedValue0, 1337);
        assertTrue(returnedValue1);
    }
}
