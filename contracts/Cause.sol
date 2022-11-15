// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Cause 
{   
    uint16 private causeId ; 
    string private name ; 
    string private description ; 
    string private imageUrl ; 
    address private issuer_address ;
    uint256 private amount_to_raise ;
    uint256 private raised_amount ;
    mapping (address => uint256) donors_to_amount_donated;
    address[] donors ; 
    bool isNFTminted = false ; 


    constructor(uint16 _causeId)
    {
        causeId = _causeId ; 
    }

    function setName(string memory _name) public 
    {
        name = _name ; 
    }

    function getName() view public returns(string memory)
    {
        return name ; 
    }

    function setDescription(string memory _description) public 
    {
        description = _description ; 
    }

    function getDescription() view public returns(string memory)
    {
        return description ; 
    }

    function setImageUrl(string memory _imageUrl) public 
    {
        imageUrl = _imageUrl ; 
    }

    function getImageUrl() view public returns(string memory)
    {
        return imageUrl ; 
    }

    function getCauseId() view public returns(uint16)
    {
        return causeId ; 
    }

    function setIssuerAddress(address _addr) public
    {
        issuer_address = _addr ; 
    }

    function getIssuerAddress() view public returns(address)
    {
        return issuer_address ; 
    }

    function setAmountToRaise(uint256 _amount_to_raise) public 
    {
        amount_to_raise = _amount_to_raise ; 
    }

    function getAmountToRaise() view public returns(uint256)
    {
        return amount_to_raise ; 
    }

    function setRaisedAmount(uint256 _raised) public 
    {
        raised_amount = _raised ; 
    }

    function getRaisedAmount() view public returns(uint256)
    {
        return raised_amount ; 
    }

    function getNFTStatus() view public returns(bool)
    {
        return isNFTminted ; 
    }

    function setNFTStatus(bool _status) public
    {
        isNFTminted = _status ; 
    }

    function setDonorToAmount(uint256 amount) public 
    {
        if(msg.sender != issuer_address)
        {
            donors_to_amount_donated[msg.sender] += amount ; 
            uint256 raised = getRaisedAmount();
            setRaisedAmount(raised+amount);
            for(uint i=0 ; i < donors.length ; i++)
            {
                if(donors[i] == msg.sender)
                {
                    break ; 
                }
            }
            if(i >= donors.length)
            {
                donors.push(msg.sender); 
            }
        }
    }

} 