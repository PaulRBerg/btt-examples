// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import { BaseTest } from "../Base.t.sol";

contract BundledItsTest is BaseTest {
    event NewBundled(uint256 newBundled);

    function test_ShouldUpdateStorage() external {
        foo.bundledIts({ x: 42 });
        uint256 bundledValue = foo.bundled();
        assertEq(bundledValue, 42);
    }

    function test_ShouldEmitAnEvent() external {
        vm.expectEmit({ emitter: address(foo) });
        emit NewBundled({ newBundled: 42 });
        foo.bundledIts({ x: 42 });
    }

    function test_ShouldReturnX() external {
        uint256 returnedValue = foo.bundledIts({ x: 42 });
        assertEq(returnedValue, 42);
    }
}
