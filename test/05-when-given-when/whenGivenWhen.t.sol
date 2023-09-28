// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import { BaseTest } from "../Base.t.sol";

contract WhenGivenWhenTest is BaseTest {
    function test_RevertWhen_TheCallerIsUnknown() external {
        vm.startPrank({ msgSender: address(0xbeef) });
        vm.expectRevert("the caller must be 0xcafe");
        foo.whenGivenWhen({ x: true });
    }

    modifier whenTheCallerIsKnown() {
        vm.startPrank({ msgSender: address(0xcafe) });
        _;
    }

    function test_RevertGiven_ValueIsLessThan100() external whenTheCallerIsKnown {
        foo.setValue({ newValue: 42 });
        vm.expectRevert("value must not be less than 100");
        foo.whenGivenWhen({ x: true });
    }

    modifier givenValueIsNotLessThan100() {
        foo.setValue({ newValue: 1337 });
        _;
    }

    function test_RevertWhen_XIsFalse() external whenTheCallerIsKnown givenValueIsNotLessThan100 {
        vm.expectRevert("x must not be false");
        foo.whenGivenWhen({ x: false });
    }

    function test_WhenXIsTrue() external whenTheCallerIsKnown givenValueIsNotLessThan100 {
        foo.setValue({ newValue: 1337 });
        (uint256 returnedValue0, bool returnedValue1) = foo.whenGivenWhen({ x: true });
        assertEq(returnedValue0, 1337);
        assertTrue(returnedValue1);
    }
}
