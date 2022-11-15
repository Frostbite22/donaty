// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./AbstractUser.sol" ;

contract Enterprise is AbstractUser
{
    string private name ; 
    string private matricule ; 
    uint16 private id ; 
    address private account ; 
    string private kind = "enterprise" ; 

    constructor(uint16 _id)
    {
        id = _id ;
    }


    function setName(string calldata _name)  public 
    {
        name = _name ;
    }

    function getName()  public view returns(string memory) 
    {
        return name ;
    }

      function setMatricule(string calldata _matricule)  public 
    {
        matricule = _matricule ;
    }

    function getMatricule()  public view returns(string memory) 
    {
        return matricule ;
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

     function getKind()  public view returns(string memory) 
    {
        return kind ;
    }

}