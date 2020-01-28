pragma solidity ^0.5.0;

import "./MoneyRequest.sol"

contract RequestFactory {


  function createMoneyRequest(
      address payable origin,
      uint256 amountRequested,
      uint256 paybackAmount,
      string memory loanType
  ) public returns (address moneyRequest) {
      moneyRequest = address(
        new moneyRequest(origin, amountRequested, paybackAmount,
                        loanType, msg.sender)
      );
    }
}
