// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;


// Import this file to use console.log
import "hardhat/console.sol";
import "./IndividuDonatorToCauseFactory.sol" ;
import "./EnterpriseDonatorToCauseFactory.sol" ;
import "./InterfEnterpriseDonatorToCauseFactory.sol" ;
import "./InterfIndividuDonatorToCauseFactory.sol" ;


contract UserDonatorToCauseFactory 
{
    uint16 private id ; 
    address EDTCFaddress ;
    address IDTCFaddress ;


    function createUserDonatorToCause(uint16 _userId, uint16 _causeId,string memory _kind, address _EDTCFaddress, address _IDTCFaddress) public 
    {
        if(keccak256(bytes(_kind))=="enterprise")
        {
            EDTCFaddress = _EDTCFaddress ;
            InterfEnterpriseDonatorToCauseFactory enterpriseDonatorToCauseFactory = InterfEnterpriseDonatorToCauseFactory(EDTCFaddress) ;
            enterpriseDonatorToCauseFactory.createEnterpriseDonatorToCause(_userId,_causeId) ;

        }
        else if (keccak256(bytes(_kind))=="individual")
        {
            IDTCFaddress = _IDTCFaddress ;
            InterfIndividuDonatorToCauseFactory inividuDonatorToCauseFactory = InterfIndividuDonatorToCauseFactory(EDTCFaddress) ;
            inividuDonatorToCauseFactory.createindividuDonatorToCause(_userId,_causeId) ;
        }
       
    }

}
