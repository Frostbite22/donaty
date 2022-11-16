# DONEX

This is a decentralized fundraising platform system built with hardhat, solidity and Ethers JS and based on smart contracts

## Requirements :
You need to have a wallet with testnet ethereum on the Goerli network
[Get free Goerli faucet](https://goerlifaucet.com/)


## Setting up the project 

### Install npm dependencies 
``` npm i ```
### Configurations 
create ```.env``` file in the root directory 
set up these constants
```
QUICKNODE_API_URL=YOUR_QUICKNODE_API_KEY
GOERLI_ACCOUNT_PK=YOUR_GOERLI_ACCOUNT_PK
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_API_KEY
COINMARKETCAP_API_KEY=YOUR_COINMARKETCAP_API_KEY
```
## Try running some of the following tasks:

compile the contracts 

```
npx hardhat compile 
```

deploy the contracts locally 
```
npx hardhat run scripts/deploy.js
```

deploy the contracts to goerli network 
```
npx hardhat run scripts/deploy.js --network goerli
```

Unit Testing for the contract 
```
npx hardhat test 
```

Test coverage report  
```
npx hardhat coverage 
```

Execute Balance task  
```
npx hardhat balance --account account_public_key 
```

## Deployed at 

### Instructions 
For the app users, connect your Wallet with an account that have GoerliETH on the Goerli testnet network [get GoerliETH for free](https://goerlifaucet.com/), create an account if you are a user and get access to the plateform. <br>
If you are an admin, you should connect with your admin account already written on the blockchain.
