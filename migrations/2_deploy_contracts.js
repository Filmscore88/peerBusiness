var MoneyRequest = artifacts.require("./MoneyRequest.sol");

module.exports = function(deployer) {
  deployer.deploy(MoneyRequest, 100, 200, "bills");
};
