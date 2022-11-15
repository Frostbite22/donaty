// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./EnterpriseDonatorToCause.sol" ;
import "./Enterprise.sol";

interface InterfEnterpriseDonatorToCauseFactory 
{
    function createEnterpriseDonatorToCause(uint16 _individuId, uint16 _causeId) external ;
    function getEnterpriseDonatorToCauseObjectById(uint16 _id) view external returns(Enterprise);
    function getEnterprisesLength() external view returns(uint256);

}