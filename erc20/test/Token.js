const ethers = require("ethers");

const Token = artifacts.require("Token");
contract("Token",()=>{
    it("total supply of token",async()=>{
        let token = await Token.deployed();
        let tokensupply = await token.totalSupply();
        console.log("totalsupply of token :"+tokensupply);
    });

    it("balance of token",async()=>{
        let token = await Token.deployed();
        let userBalance = await token.balanceOf("0xECC210293F28ef2c9700B6d2B773B512b432B8b4");
        console.log("this is a balance of 0xECC210293F28ef2c9700B6d2B773B512b432B8b4 :"+userBalance);
    });
    it("transfering of tokens",async()=>{
        let token = await Token.deployed();
        await token.transfer("0xE526E2f314ab71386Fe337e4B62560604Fcb4fad",500);
         let userBalance = await token.balanceOf("0xE526E2f314ab71386Fe337e4B62560604Fcb4fad");
        console.log("current balance after transaction complete: "+userBalance)
    });
it("approving function",async()=>{
    let token = await Token.deployed();
    await token.approve("0x7c93b36eD6B2D296dc561D98F08974E6AEeeBE7C",1000)
    console.log("approving is complete");
})

    it("balance after transfrom",async()=>{
        let token = await Token.deployed();
        let account_1 = await token.balanceOf("0xECC210293F28ef2c9700B6d2B773B512b432B8b4");
        let account_2 = await token.balanceOf("0xE526E2f314ab71386Fe337e4B62560604Fcb4fad");
     
        console.log("account_1 balance: "+account_1,"account_2 balance: "+account_2)
    });
})
