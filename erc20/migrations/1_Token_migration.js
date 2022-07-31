
const Token = artifacts.require("Token");

module.exports = function (deployer) {
  deployer.deploy(Token,"Haq","HQ",10000,1);
};
