const RequestFactory = artifacts.require("./RequestFactory");
const RequestManager = artifacts.require("./RequestManager");

module.exports = async deployer => {
  const factory = await RequestFactory.deployed();

  await deployer.deploy(RequestManager, factory.address);
};
