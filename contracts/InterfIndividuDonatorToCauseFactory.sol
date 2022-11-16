// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./IndividuDonatorToCause.sol" ;
import "./Individual.sol";

interface InterfIndividuDonatorToCauseFactory 
{
    function createIndividuDonatorToCause(uint16 _individuId, uint16 _causeId) external returns(uint16,uint16,uint16) ;
    function getIndividuDonatorToCauseObjectById(uint16 _id) view external returns(Individual);
    function getIndividusLength() external view returns(uint256);

}