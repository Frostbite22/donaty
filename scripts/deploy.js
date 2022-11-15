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
    const [id, ent_name,matricule,account] = event.args;

    console.log(`created enterprise with id ${id} firstName ${ent_name} with acc ${account} and matricule ${matricule}`);


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

    // creating a path

    const createCauseTxn = await causeContract.createCause("deforestation in Chaanbi",
    "Chaanbi is facing huge issues concerning deforestation","https://upload.wikimedia.org/wikipedia/commons/a/a8/Chambi1.JPG",
    "0x4420F374a97077357272734d8753d28E6346B341",10000);
    const cause= await createCauseTxn.wait(); 
    const eventCause = cause.events.find(event => event.event ==='causeCreated');
    const [id_cause,causeName,description,url,issuer_adr,amount] = eventCause.args ;
    console.log(`cause created with id ${id_cause} and name ${causeName} : ${description} , ${url}, issuer: ${issuer_adr}, amount : ${amount} `);
    
//     // deploy the level contract 
//     const levelContractFactory = await hre.ethers.getContractFactory("LevelFactory");
//     const levelContract = await levelContractFactory.deploy();
//     await levelContract.deployed(); 
    
//     // verify deployment of levelContract contracts
//     if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
//     {
//       console.log("Waiting for block confirmations ...");
//       await levelContract.deployTransaction.wait(6);
//       await verify(levelContract.address,[]);
//     }
    

//     // creating a level for that path
//     const createLevelTxn = await levelContract.createLevel("backend lvl1","backend dev nodejs","https://d1fmx1rbmqrxrr.cloudfront.net/zdnet/i/edit/ne/2021/07/NodeJS.jpg",20,id_path);
//     const level= await createLevelTxn.wait(); 
//     const eventLevel = level.events.find(event => event.event ==='levelCreated');
//     const [id_level,levelName,description_lvl,url_lvl,nb_places,id_path_fk] = eventLevel.args ;
//     console.log(`level created with id ${id_level} and name ${levelName} : ${description_lvl} , ${url_lvl} with nbplace ${nb_places} with path id ${id_path_fk}`);

//     // session contract deployment
//     const sessionContractFactory = await hre.ethers.getContractFactory("SessionFactory");
//     const sessionContract = await sessionContractFactory.deploy();
//     await sessionContract.deployed(); 

//     // verify deployment of session contracts
//     if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
//     {
//       console.log("Waiting for block confirmations ...");
//       await sessionContract.deployTransaction.wait(6);
//       await verify(sessionContract.address,[]);
//     }

//     // creating a session for that level

//     const dat = new Date(2022,12,25,14,30,0);
//     const createSessTxn = await sessionContract.createSession("session one : js",dat.getTime()/1000,id_level);

//     const session = await createSessTxn.wait(); 
//     const eventSession = session.events.find(event => event.event ==='sessionCreated');
//     const [id_sess,name,date,level_id_fk] = eventSession.args ;
//     const response_date = new Date(date*1000)
//     console.log(`session created with id ${id_sess} with name ${name} and date ${response_date} and level id : ${level_id_fk} `);

//     const createSess2Txn = await sessionContract.createSession("session two : react",dat.getTime()/1000,id_level);
//     const session2 = await createSess2Txn.wait(); 
//     const eventSession2 = session2.events.find(event => event.event ==='sessionCreated');
//     const [id_sess2,name2,date2,level_id_fk_2] = eventSession2.args ;
//     const response_date2 = new Date(date2*1000)

//     console.log(`session created with id ${id_sess2} with name ${name2} and date ${response_date2} and level id : ${level_id_fk_2}`);


//     // studentToLevel contract 
//     const stdToLvlContractFactory = await hre.ethers.getContractFactory("StudentLevelFactory");
//     const stdToLvlContract = await stdToLvlContractFactory.deploy();
//     await stdToLvlContract.deployed(); 

//     // verify deployment of studentToSession contracts
//     if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
//     {
//       console.log("Waiting for block confirmations ...");
//       await stdToLvlContract.deployTransaction.wait(6);
//       await verify(stdToLvlContract.address,[]);
//     }

//     const stdToLevelTnx = await stdToLvlContract.createStudentLevel(id,id_level,levelContract.address) ;
//     const stdToLvl = await stdToLevelTnx.wait(); 
//     const eventStdToLvl = stdToLvl.events.find(event => event.event ==='studentLevelCreated');
//     const [id_std_session,studentId,levelId] = eventStdToLvl.args ;
//     console.log(`student added to level ${id_std_session} : ${studentId} : ${levelId} `); 


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
