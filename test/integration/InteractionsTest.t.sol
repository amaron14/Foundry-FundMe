// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract FundMeTestIntegration is Test {
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 public constant SEND_VALUE = 0.1 ether; // just a value to make sure we are sending enough!
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(USER, STARTING_USER_BALANCE);
    }

    function testUserCanFundAndWithdraw() public {
        FundFundMe fund = new FundFundMe();
        fund.fundFundMe(address(fundMe), USER);
        assertEq(fundMe.getFunder(0), USER);
        assertEq(fundMe.getAddressToAmountFunded(USER), 1e18);
        WithdrawFundMe withdraw = new WithdrawFundMe();
        withdraw.withdrawFundMe(address(fundMe));
        uint256 endingFundMeBalance = address(fundMe).balance;
        assertEq(endingFundMeBalance, 0);
    }
}
