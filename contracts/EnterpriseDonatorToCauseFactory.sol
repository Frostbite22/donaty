// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;


// Import this file to use console.log
import "hardhat/console.sol";
import "./EnterpriseDonatorToCause.sol" ;

contract EnterpriseDonatorToCauseFactory 
{
    uint16 private id ; 
    EnterpriseDonatorToCause[] enterpriseDonatorToCause ;
    event enterpriseDonatorToCauseCreated (uint16,uint16, uint16);

    function individuDonatorToCauseCreated(uint16 _enterpriseId, uint16 _causeId) public 
    {
        EnterpriseDonatorToCause entCause = new EnterpriseDonatorToCause(id,_enterpriseId,_causeId);
        enterpriseDonatorToCause.push(entCause);
        emit enterpriseDonatorToCauseCreated(id,_enterpriseId,_causeId);
        id++;
       
    }

    function getIndividuCausesId(uint16 _enterpriseId) public view returns(uint16[] memory)
    {
        uint16[] memory causes = new uint16[](enterpriseDonatorToCause.length) ;
        uint causeNum ;
        bool empty = true ;

        for (uint16 i=0; i<enterpriseDonatorToCause.length ;i++)
        {
            if (enterpriseDonatorToCause[i].getEnterpriseId()==_enterpriseId)
            {
                empty = false ; 
                causes[causeNum] = enterpriseDonatorToCause[i].getCauseId();
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

    function getCauseEnterprisesId(uint16 _causeId) public view returns(uint16[] memory)
    {
        uint16[] memory enterprises = new uint16[](enterpriseDonatorToCause.length) ;
        uint enterpriseNum ;
        bool empty = true ;

        for (uint16 i=0; i<enterpriseDonatorToCause.length ;i++)
        {
            if (enterpriseDonatorToCause[i].getCauseId()==_causeId)
            {
                empty = false ;
                enterprises[enterpriseNum] = enterpriseDonatorToCause[i].getEnterpriseId();
                enterpriseNum++ ;
            }
        }
        if(empty) 
        {
            revert("No object found");
        }
        else
        {
            return enterprises ;  
        }
    }
}
