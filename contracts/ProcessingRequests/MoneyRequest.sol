pragma solidity ^0.5.0;

contract moneyRequest {
    address payable public asker,
    address payable public lender,
    bool public lentMoney,
    bool public debtPayedOff,
    uint256 public  amountRequested,
    uint256 public  paybackAmount,
    string public loanType


    constructor(
        address payable asker,
        uint256 amountRequested,
        uint256 paybackAmount,
        string memory loanType,
    ) public {
        asker = asker,
        amountRequested = amountRequested,
        paybackAmount = paybackAmount,
        loanType = loanType
    }




}
