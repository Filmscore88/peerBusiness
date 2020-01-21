pragma solidity ^0.5.0;

import "./MoneyRequest.sol"

contract RequestFactory {


  function createMoneyRequest(
      uint256 amount,
      uint256 paybackAmount,
      string memory purpose,
      address payable origin
  ) public returns (address moneyRequest) {

      moneyRequest = address(
        new moneyRequest(
            asker, amountRequested, paybackAmount,
            loanType, contractFee)
      )
    }



}
