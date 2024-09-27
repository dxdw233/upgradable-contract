// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV2 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    /// @notice Can't set storage variable in the implementation contract's constructor
    constructor() {
        _disableInitializers();
    }

    /// @notice When proxy will call this function instead of constructro
    /// @notice The `initializer` modifier prevent reinitialize
    function initialize() public initializer {
        __Ownable_init(msg.sender); // set owner to address
        __UUPSUpgradeable_init();
    }

    function setNumber(uint256 _number) external {
        number = _number;
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function getVersion() external pure returns (uint256) {
        return 2;
    }

    /// @notice Anyone can upgrade this contract
    function _authorizeUpgrade(address newImplementation) internal override {}
}
