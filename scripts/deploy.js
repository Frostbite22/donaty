const hre = require("hardhat");


const main = async () => {

  const [owner, otherAccount] = await ethers.getSigners();

    // create enterprise Factory contract 
    const enterpriseContractFactory = await hre.ethers.getContractFactory("EnterpriseFactory");

    const enterpriseContract = await enterpriseContractFactory.deploy();
    await enterpriseContract.deployed();

    // verify deployment of enterprise contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await enterpriseContract.deployTransaction.wait(6);
      await verify(enterpriseContract.address,[]);
    }

    console.log(`Deployed contract to: ${enterpriseContract.address}`);

    // creating an enterprise account

    const enterpriseToCreate = await enterpriseContract.createEnterprise("sofrecom","123/*/456/*","0x11ec5aDb332d4Ada2ba6C0a1E87f4B491841Eb78")
    const enterprise = await enterpriseToCreate.wait();
    const event = enterprise.events.find(event => event.event === 'enterpriseCreated');
    const [id_ent, ent_name,matricule,account] = event.args;

    console.log(`created enterprise with id ${id_ent} firstName ${ent_name} with acc ${account} and matricule ${matricule}`);


      // create an Individual Factory contract 
      const individuContractFactory = await hre.ethers.getContractFactory("IndividualFactory");

      const individuContract = await individuContractFactory.deploy();
      await individuContract.deployed();
  
      // verify deployment of individual contracts
      if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
      {
        console.log("Waiting for block confirmations ...");
        await individuContract.deployTransaction.wait(6);
        await verify(individuContract.address,[]);
      }
  
      console.log(`Deployed contract to: ${individuContract.address}`);
  
      // creating an individual
  
      const individuToCreate = await individuContract.createIndividual("momo","bechi5","0x4420F374a97077357272734d8753d28E6346B341")
      const individu = await individuToCreate.wait();
      const eventIndividu = individu.events.find(event => event.event === 'individualCreated');
      const [idIndividu, first,last,accountIndividu] = eventIndividu.args;

      console.log(`created individu with id ${idIndividu} firstName ${first} and lastName ${last} with acc ${accountIndividu} `);

    // deploying cause contract
    const causeContractFactory = await hre.ethers.getContractFactory("CauseFactory");
    const causeContract = await causeContractFactory.deploy();
    await causeContract.deployed(); 


    // verify deployment of CauseContract contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await causeContract.deployTransaction.wait(6);
      await verify(causeContract.address,[]);
    }

    // creating a cause

    const createCauseTxn = await causeContract.createCause("deforestation in Chaanbi",
    "Chaanbi is facing huge issues concerning deforestation","https://upload.wikimedia.org/wikipedia/commons/a/a8/Chambi1.JPG",
    "0x4420F374a97077357272734d8753d28E6346B341",10000);
    const cause= await createCauseTxn.wait(); 
    const eventCause = cause.events.find(event => event.event ==='causeCreated');
    const [id_cause,causeName,description,url,issuer_adr,amount] = eventCause.args ;
    console.log(`cause created with id ${id_cause} and name ${causeName} : ${description} , ${url}, issuer: ${issuer_adr}, amount : ${amount} `);
    

    //deploy individu donator to cause factory 
    const indivToCauseContractFactory = await hre.ethers.getContractFactory("IndividuDonatorToCauseFactory");

    const indivToCauseContract = await indivToCauseContractFactory.deploy();
    await indivToCauseContract.deployed();

    // verify deployment of enterprise contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await indivToCauseContract.deployTransaction.wait(6);
      await verify(indivToCauseContract.address,[]);
    }

    console.log(`Deployed contract to: ${indivToCauseContract.address}`);
  

    // enterprise donator to cause factory 
    const enterToCauseContractFactory = await hre.ethers.getContractFactory("EnterpriseDonatorToCauseFactory");

    const enterToCauseContract = await enterToCauseContractFactory.deploy();
    await enterToCauseContract.deployed();

    // verify deployment of enterprise contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await enterToCauseContract.deployTransaction.wait(6);
      await verify(enterToCauseContract.address,[]);
    }

    console.log(`Deployed contract to: ${enterToCauseContract.address}`);



    const userToCauseTnx = await enterToCauseContract.createEnterpriseDonatorToCause(id_ent,id_cause) ;
    const userToCause = await userToCauseTnx.wait(); 
    const eventUserToCause = userToCause.events.find(event => event.event ==='enterpriseDonatorToCauseCreated');
    const [id,enter_id,cause_id] = eventUserToCause.args ;
    console.log(`Enterprise donor donated to cause ${id} : enterpriseId ${enter_id} : causeId ${cause_id} `); 


    // user donator to cause factory 


    // const userDonatorToCauseContractFactory = await hre.ethers.getContractFactory("UserDonatorToCauseFactory");
    // const userDonatorToCauseContract = await userDonatorToCauseContractFactory.deploy();
    // await userDonatorToCauseContract.deployed(); 

    // // verify deployment of userToCause contracts
    // if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    // {
    //   console.log("Waiting for block confirmations ...");
    //   await userDonatorToCauseContract.deployTransaction.wait(6);
    //   await verify(userDonatorToCauseContract.address,[]);
    // }

    // const userToCauseTnx = await userDonatorToCauseContract.createUserDonatorToCause(id_ent,id_cause,"enterprise",enterToCauseContract.address,indivToCauseContract.address) ;
    // const userToCause = await userToCauseTnx.wait(); 
    // const eventUserToCause = userToCause.events.find(event => event.event ==='enterpriseDonatorToCauseCreated');
    // const [id,enter_id,cause_id] = eventUserToCause.args ;
    // console.log(`Enterprise donor donated to cause ${id} : enterpriseId ${enter_id} : causeId ${cause_id} `); 


//     const levelCheck = await levelContract.getLevelById(id_level) ;
//     console.log(levelCheck)


//     // levels of Student 0
//     const levels = await stdToLvlContract.getStudentLevelsId(id);
//     console.log(`levels of Student ${id}`);
//     console.log([...new Set(levels)]);
//     // Students of Level 0
//     const students1 = await stdToLvlContract.getLevelStudentsId(id_level);
//     console.log(`students of level ${id_sess}`);
//     console.log([...new Set(students1)]);

// }

// async function verify(contractAddress,args)
// {
//   console.log("Verifying contract ..");
//   try{
//   await run("verify:verify", {
//     address : contractAddress,
//     constructor : args 
//   })
//   }catch (e){
//     if (e.message.toLowerCase().includes("already verified"))
//     {
//       console.log("already verified");
//     }
//     else 
//     {
//       console.log(e);
//     }
//   }

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
