pragma solidity ^0.5.0;

interface RequestFactoryInterface {
    function creatMoneyRequestInterface(uint256, uint256, string calldata, address payable) external returns(address);
}

interface LendingRequestInterface {
    function deposit(address payable) external payable returns(bool, bool);
    function withdraw(address) external;
    function cleanUp() external;
    function cancelRequest() external;
    function asker() external view returns(address payable);
    function withdrawnByLender() external view returns(bool);
    function getRequestParameters() external view returns(address payable, address payable, uint256, uint256, uint256, string memory);
    function getRequestState() external view returns(bool, bool, bool, bool);
}
contract RequestManager {
    address private requestFactory;
    address[] private moneyRequests;

    constructor(address _factory) public {
        requestFactory = _factory;
    }

    function query(amount, paybackAmount, loanType){
      RequestFactoryInterface(requestFactory).creatMoneyRequestInterface(
        amount, paybackAmount, loanType, msg.sender
        );


    }

    function deposit(public payable moneyRequest) public payable{
      MoneyRequestInterface(moneyRequest).deposit.value(msg.value)(msg.sender);
    }
}
