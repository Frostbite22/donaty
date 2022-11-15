// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Import this file to use console.log
import "hardhat/console.sol";
import "./Individual.sol" ;
import "./AbstractUser.sol" ;

contract IndividualFactory
{
    
    uint16 private id ; 
    AbstractUser[] individuals ;
    event individualCreated (uint16,string, string,address);

    function isIndividualUnique(address _account) public view returns(bool)
    {
        for (uint i=0 ; i< Individuals.length ; i++)
        {
            if (_account == individuals[i].getAddress())         
            {
                return false ;
            }
        }
        return true ;
    }

    function createIndividual(string memory _firstName, string memory _lastName, address _account) public 
    {
        if(isIndividualUnique(_account))
        {
            AbstractUser ind = new Individual(id) ;
            ind.setFirstName(_firstName);
            ind.setLastName(_lastName);  
            ind.setAddress(_account);
            individuals.push(ind);
            emit IndividualCreated(id,_firstName,_lastName,_account);
            id++ ;
        }
        else 
        {
            revert("This Individual already exists");
        }
    }


    function getIndividualsLength() public view returns(uint256)
    {
        return individuals.length ;
    }

    function getIndividualById(uint16 _id) public view returns (uint16,string memory, string memory,address)
    {
        for (uint256 i=0; i<individuals.length ;i++)
        {
            if (individuals[i].getId()==_id)
            {
                return (individuals[i].getId(),individuals[i].getFirstName(),individuals[i].getLastName(),individuals[i].getAddress());
            }
        }
        revert('Individual with this id is not Not found');

    }

    function getIndividualByAddress(address account) public view returns(uint16,string memory, string memory,address)
    {
        for (uint256 i=0; i<individuals.length ;i++)
        {
            if (individuals[i].getAddress()==account)
            {
                return (individuals[i].getId(),individuals[i].getFirstName(),individuals[i].getLastName(),individuals[i].getAddress());
            }
        }
        revert('Individual with this account address is not Not found');
    }

    function getCurrentId() public view returns(uint16)
    {
        return id ; 
    }


}