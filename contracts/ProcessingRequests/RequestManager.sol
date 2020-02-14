pragma solidity ^0.5.0;

interface RequestFactoryInterface {
    function createMoneyRequestInterface(uint256, uint256, string calldata, address payable) external returns(address);
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

    function query(uint256 amount, uint256 paybackAmount, string memory loanType) public {

      address request = RequestFactoryInterface(requestFactory).createMoneyRequestInterface(
        amount, paybackAmount, loanType, msg.sender
       );

      moneyRequests.push(request);
    }

    function deposit(address payable moneyRequest) public payable{
      MoneyRequestInterface(moneyRequest).deposit.value(msg.value)(msg.sender);
    }
}
