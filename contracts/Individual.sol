// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./AbstractUser.sol" ;

contract Individual is AbstractUser
{
    string private firstName ; 
    string private lastName ; 
    uint16 private id ; 
    address private account ; 

    constructor(uint16 _id)
    {
        id = _id ;
    }


    function setFirstName(string calldata _fn)  public 
    {
        firstName = _fn ;
    }

    function getFirstName()  public view returns(string memory) 
    {
        return firstName ;
    }

    function setLastName(string calldata _ln)  public
    {
        lastName = _ln ;
    }

    function getLastName()  view  public returns(string memory) 
    {
        return lastName ;
    }

    function getId() override public view returns(uint16) 
    {
        return id ; 
    }

    function getAddress() override public view returns(address) 
    {
        return account ; 
    }

    function setAddress(address _account)  override public
    {
        account = _account ;
    }

}