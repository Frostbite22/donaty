// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Cause.sol";
import "./IndividualFactory.sol" ;

contract IndividuDonatorToCause
{
    uint16 private enterpriseId ;
    uint16 private causeId ;
    uint16 private id ;

    constructor(uint16 _id,uint16 _enterpriseId, uint16 _causeId)
    {
        enterpriseId = _enterpriseId ; 
        causeId = _causeId ;
        id = _id ;
    }

    function getId() public view returns(uint16)
    {
        return id ; 
    }

    function getEnterpriseId() public view returns(uint16)
    {
        return enterpriseId ;
    }

    function getCauseId() public view returns(uint16)
    {
        return causeId ;
    }


}
