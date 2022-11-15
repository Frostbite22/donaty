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

    function isLevelUnique( string memory _name) internal view returns(bool)
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

    function createLevel(string memory _name,string memory _description,string memory _imageUrl,address _issuer_addr, uint256 _amount_to_raise) public 
    {
        if(isLevelUnique(_levelName))
        {
            Level level = new Level(id);
            level.setLevelName(_levelName);
            level.setDescription(_description);
            level.setImageUrl(_imageUrl);
            level.setPlacesLeft(_placesLeft);
            level.setPathId(_pathId);
            levels.push(level) ;
            emit levelCreated(id,_levelName,_description,_imageUrl,_placesLeft,_pathId);
            id++ ; 
        }
        else 
        {
            revert("Level name is not unique !");
        }
    }


    function getLevelsLength() public view returns(uint256)
    {
        return id ;
    }

    function getLevelById(uint16 _id) public view returns (uint16,string memory,string memory,string memory,uint16, uint16)
    {
        for (uint256 i=0; i< levels.length ;i++)
        {
            if (levels[i].getLevelId()==_id)
            {
                return (levels[i].getLevelId(),levels[i].getLevelName(),levels[i].getDescription(),levels[i].getImageUrl(),levels[i].getPlacesLeft(),levels[i].getPathId());
            }
        }
        revert('Level with this id is not Not found');
    }

    function getLevelObjectById(uint16 _id) public view returns(Level)
    {
        return levels[_id];
    }

    //function donate 

    

   
} 