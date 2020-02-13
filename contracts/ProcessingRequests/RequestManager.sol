pragma solidity ^0.5.0;

interface RequestFactoryInterface {
    function creatMoneyRequestInterface(uint256, uint256, string calldata, address payable) external returns(address);
}

interface MoneyRequestInterface {
    function deposit(address payable) external payable returns(bool, bool);

}
contract RequestManager {
    address private requestFactory;
    address[] private moneyRequests;

    constructor(address factory) public {
        requestFactory = factory;
    }

    function query(amount, paybackAmount, loanType){

      address request = RequestFactoryInterface(requestFactory).createMoneyRequestInterface(
        msg.sender, paybackAmount, loanType
       );

      moneyRequests.push(request);
    }

    function deposit(public payable moneyRequest) public payable{
      MoneyRequestInterface(moneyRequest).deposit.value(msg.value)(msg.sender);
    }
}
