// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";


abstract contract AbstractUser
{

    function getId() public virtual view returns(uint16);
    
    function getAddress() public virtual view returns(address);

    function setAddress(address _account)  public virtual ;

}