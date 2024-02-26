// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    function fundFundMe(address fundMeAddress, address USER) public {
        if (USER != address(0)) {
            vm.startPrank(USER);
        } else {
            vm.startBroadcast();
        }
        FundMe(payable(fundMeAddress)).fund{value: 1 ether}();
        if (USER != address(0)) {
            vm.stopPrank();
        } else {
            vm.stopBroadcast();
        }
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        fundFundMe(mostRecentlyDeployed, address(0));
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address fundMeAddress) public {
        vm.startBroadcast();
        FundMe(payable(fundMeAddress)).withdraw();

        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(mostRecentlyDeployed);
    }
}
