// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;


// Import this file to use console.log
import "hardhat/console.sol";
import "./IndividuDonatorToCause.sol" ;

contract IndividuDonatorToCauseFactory 
{
    uint16 private id ; 
    IndividuDonatorToCause[] individuDonatorToCause ;
    event individuDonatorToCauseCreated (uint16,uint16, uint16);

    function createindividuDonatorToCause(uint16 _individuId, uint16 _causeId) public 
    {
       
        IndividuDonatorToCause indCause = new IndividuDonatorToCause(id,_individuId,_causeId);
        individuDonatorToCause.push(indCause);
        emit individuDonatorToCauseCreated(id,_individuId,_causeId);
        id++;
       
    }

    function getIndividuCausesId(uint16 _individuId) public view returns(uint16[] memory)
    {
        uint16[] memory causes = new uint16[](individuDonatorToCause.length) ;
        uint causeNum ;
        bool empty = true ;

        for (uint16 i=0; i<individuDonatorToCause.length ;i++)
        {
            if (individuDonatorToCause[i].getIndividuId()==_individuId)
            {
                empty = false ; 
                causes[causeNum] = individuDonatorToCause[i].getCauseId();
                causeNum++ ;
            }
        }
        if(empty) 
        {
            revert("No object found");
        }
        else
        {
            return causes ;  
        }
    }

    function getCauseIndividualsId(uint16 _causeId) public view returns(uint16[] memory)
    {
        uint16[] memory individus = new uint16[](individuDonatorToCause.length) ;
        uint individuNum ;
        bool empty = true ;

        for (uint16 i=0; i<individuDonatorToCause.length ;i++)
        {
            if (individuDonatorToCause[i].getCauseId()==_causeId)
            {
                empty = false ;
                individus[individuNum] = individuDonatorToCause[i].getIndividuId();
                individuNum++ ;
            }
        }
        if(empty) 
        {
            revert("No object found");
        }
        else
        {
            return individus ;  
        }
    }
}
