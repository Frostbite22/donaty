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
    event individuDonatorToCauseCreated (uint16,uint16, uint16);
    event enterpriseDonatorToCauseCreated (uint16,uint16, uint16);


    function createUserDonatorToCause(uint16 _userId, uint16 _causeId,string memory _kind, address _EDTCFaddress, address _IDTCFaddress) public 
    {

        if(keccak256(bytes(_kind))=="enterprise")
        {
            InterfEnterpriseDonatorToCauseFactory enterpriseDonatorToCauseFactory = InterfEnterpriseDonatorToCauseFactory(_EDTCFaddress) ;
            (uint16 idret,uint16 enterpriseIdret,uint16 causeIdret) = enterpriseDonatorToCauseFactory.createEnterpriseDonatorToCause(_userId,_causeId) ;
            emit enterpriseDonatorToCauseCreated(idret,enterpriseIdret,causeIdret);

        }
        else if (keccak256(bytes(_kind))=="individual")
        {
            InterfIndividuDonatorToCauseFactory inividuDonatorToCauseFactory = InterfIndividuDonatorToCauseFactory(_IDTCFaddress) ;
             (uint16 idret,uint16 individuIdret,uint16 causeIdret) = inividuDonatorToCauseFactory.createIndividuDonatorToCause(_userId,_causeId) ;
            emit individuDonatorToCauseCreated(idret,individuIdret,causeIdret);
        }
       
    }

}
