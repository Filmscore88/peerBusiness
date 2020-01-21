pragma solidity ^0.5.0;

contract RequestManager {
    address private requestFactory;
    address[] private moneyRequests;

    constructor(address _factory) public {
        requestFactory = _factory;
    }
}
