// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Cause.sol" ;

contract CauseFactory 
{
    uint16 private id ; 
    Cause[] public causes ;
    event causeCreated (uint16 id,string name, string description, string imgUrl,address issuer_address,uint256 amount_to_raise);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }

    function isCauseUnique( string memory _name) internal view returns(bool)
    {
        for (uint i=0 ; i< causes.length ; i++)
        {
            if (keccak256(bytes(_name))==keccak256(bytes(causes[i].getName())))            
            {
                return false ;
            }
        }
        return true ;
    }

    function createCause(string memory _name,string memory _description,string memory _imageUrl,address _issuer_addr, uint256 _amount_to_raise) public 
    {
        if(isCauseUnique(_levelName))
        {
            Cause cause = new Cause(id);
            cause.setName(_name);
            cause.setDescription(_description);
            cause.setImageUrl(_imageUrl);
            cause.setIssuerAddress(_issuer_addr);
            cause.setAmountToRaise(_amount_to_raise);
            causes.push(cause) ;
            emit causeCreated(id,_name,_description,_imageUrl,_issuer_addr,_amount_to_raise);
            id++ ; 
        }
        else 
        {
            revert("Level name is not unique !");
        }
    }


    function getCausesLength() public view returns(uint256)
    {
        return id ;
    }

    function getCausesById(uint16 _id) public view returns (uint16,string memory,string memory,string memory,uint16, uint16)
    {
        for (uint256 i=0; i< causes.length ;i++)
        {
            if (levels[i].getCauseId()==_id)
            {
                return (causes[i].getCausesId(),causes[i].getName(),causes[i].getDescription(),causes[i].getImageUrl(),causes[i].getIssuerAddress(),levels[i].getAmountToRaise());
            }
        }
        revert('Cause with this id is not Not found');
    }

    function getCauseObjectById(uint16 _id) public view returns(Level)
    {
        return causes[_id];
    }

    //function donate 

    

   
} 