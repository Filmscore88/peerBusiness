pragma solidity ^0.5.0;

contract moneyRequest {
    address payable public asker;
    address payable public lender;
    bool private withdwdrawnbyAsker;
    bool public withdrawnbyLender;
    bool private verifiedAsker;
    bool public lentMoney;
    bool public debtPayedOff;
    uint256 public  amountRequested;
    uint256 public  paybackAmount;
    uint256 public  contractFee;
    string public loanType;


    constructor(
        address payable _asker,
        bool _verifiedAsker,
        uint256 _amountRequested,
        uint256 _paybackAmount,
        uint256 _contractFee,
        string memory _loanType
    ) public {
        asker = _asker;
        verifiedAsker = _verifiedAsker;
        amountRequested = _amountRequested;
        paybackAmount = _paybackAmount;
        contractFee = _contractFee;
        loanType = _loanType;
    }
}
