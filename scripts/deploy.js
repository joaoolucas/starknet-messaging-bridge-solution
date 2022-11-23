const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });
require("@nomiclabs/hardhat-etherscan");

async function main() {
  const [deployer] = await ethers.getSigners();

  const Ex02 = await ethers.getContractFactory("ex02");
  const ex02 = await Ex02.deploy();
  await ex02.deployed();

  console.log("Contract address:", ex02.address);

  console.log(
    "Verify Contract Address:",
    ex02.address
  );

  console.log("Waiting for Etherscan verification.....");
  await sleep(30000);

  await hre.run("verify:verify", {
    address: ex02.address
  });

  function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }
}



main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });