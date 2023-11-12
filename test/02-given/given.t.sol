// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import { BaseTest } from "../Base.t.sol";

contract GivenTest is BaseTest {
    function test_RevertGiven_ValueIsLessThan100() external {
        foo.setValue({ newValue: 42 });
        vm.expectRevert("value must not be less than 100");
        foo.given();
    }

    function test_GivenValueIsNotLessThan100() external {
        foo.setValue({ newValue: 1337 });
        uint256 returnedValue = foo.given();
        assertEq(returnedValue, 1337);
    }
}
