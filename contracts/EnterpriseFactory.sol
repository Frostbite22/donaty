// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Import this file to use console.log
import "hardhat/console.sol";
import "./Enterprise.sol" ;
import "./AbstractUser.sol" ;

contract EnterpriseFactory
{
    
    uint16 private id ; 
    AbstractUser[] enterprises ;
    event enterpriseCreated (uint16,string, string,address);

    function isEnterpriseUnique(address _account) public view returns(bool)
    {
        for (uint i=0 ; i< enterprises.length ; i++)
        {
            if (_account == enterprises[i].getAddress())         
            {
                return false ;
            }
        }
        return true ;
    }

    function createEnterprise(string memory _name, string memory _matricule,  address _account) public 
    {
        if(isEnterpriseUnique(_account))
        {
            AbstractUser ent = new Enterprise(id) ;
            ent.setName(_name);
            std.setMatricule(_matricule);  
            std.setAddress(_account);
            enterprises.push(std);
            emit EnterpriseCreated(id,_name,_matricule,_account);
            id++ ;
        }
        else 
        {
            revert("This Enterprise already exists");
        }
    }


    function getEnterprisesLength() public view returns(uint256)
    {
        return enterprises.length ;
    }

    function getEnterpriseById(uint16 _id) public view returns (uint16,string memory, string memory,address,string memory)
    {
        for (uint256 i=0; i<enterprises.length ;i++)
        {
            if (enterprises[i].getId()==_id)
            {
                return (enterprises[i].getId(),enterprises[i].getName(),enterprises[i].getMatricule(),enterprises[i].getAddress());
            }
        }
        revert('Enterprise with this id is not Not found');

    }

    function getEnterpriseByAddress(address account) public view returns(uint16,string memory, string memory,address)
    {
        for (uint256 i=0; i<enterprises.length ;i++)
        {
            if (enterprises[i].getAddress()==account)
            {
                return (enterprises[i].getId(),enterprises[i].getName(),enterprises[i].getMatricule(),enterprises[i].getAddress());
            }
        }
        revert('Enterprise with this account address is not Not found');
    }

    function getCurrentId() public view returns(uint16)
    {
        return id ; 
    }


}