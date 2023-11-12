// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

contract Foo {
    uint256 public value;
    uint256 public bundled;

    function setValue(uint256 newValue) external {
        value = newValue;
    }

    function when(bool x) public pure returns (bool) {
        if (!x) {
            revert("x must not be false");
        } else {
            return x;
        }
    }

    function given() public view returns (uint256) {
        if (value < 100) {
            revert("value must not be less than 100");
        } else {
            return value;
        }
    }

    event NewBundled(uint256 newBundled);

    function bundledIts(uint256 x) external returns (uint256) {
        bundled = x;
        emit NewBundled(x);
        return x;
    }

    function givenWhen(bool x) external view returns (uint256, bool) {
        uint256 result0 = given();
        bool result1 = when(x);
        return (result0, result1);
    }

    function whenGivenWhen(bool x) external view returns (uint256, bool) {
        if (msg.sender != address(0xcafe)) {
            revert("the caller must be 0xcafe");
        }
        uint256 result0 = given();
        bool result1 = when(x);
        return (result0, result1);
    }
}
