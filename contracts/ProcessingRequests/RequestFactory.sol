pragma solidity ^0.5.0;

import "./MoneyRequest.sol"

contract RequestFactory {


  function createMoneyRequest(
      uint256 amountRequested,
      uint256 paybackAmount,
      string memory purpose,
      address payable origin
  ) public returns (address moneyRequest) {
      moneyRequest = address(
        new moneyRequest(origin, amountRequested, paybackAmount,
                        loanType, msg.sender)
      );
    }
}
