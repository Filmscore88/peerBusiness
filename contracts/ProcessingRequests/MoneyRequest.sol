pragma solidity ^0.5.0;

contract moneyRequest {
    address payable public asker;
    address payable public lender;
    bool private withdrawnbyAsker;
    bool public withdrawnbyLender;
    bool private verifiedAsker;
    bool public lentMoney;
    bool public debtPayedOff;
    uint256 public  amountRequested;
    uint256 public  paybackAmount;
    uint256 public  contractFee;
    string public loanType;


    constructor(

        uint256 _amountRequested,
        uint256 _paybackAmount,
        string memory _loanType
    ) public {

        amountRequested = _amountRequested;
        paybackAmount = _paybackAmount;
        loanType = _loanType;
    }

    function deposit(address payable _origin) external payable returns (bool originIsLender, bool originIsAsker) {
          /*
           * Case 1:
           *          Lending Request is being covered by lender
           *          checks:
           *              must not be covered twice (!moneyLent)
           *              must not be covered if the debt has been settled
           *              must not be covered by the asker
           *              has to be covered with one transaction
           * Case 2:
           *          Asker pays back the debt
           *          checks:
           *              cannot pay back the debt if money has yet to be lent
           *              must not be paid back twice
           *              has to be paid back by the asker
           *              must be paid back in one transaction and has to include contractFee
           */
          if (!lentMoney) {
              require(_origin != asker, "invalid lender");
              require(msg.value == amountRequested, "msg.value");
              lentMoney = true;
              lender = _origin;
              originIsLender = true;
              originIsAsker = false;
          } else if (lentMoney && !debtPayedOff) {
              require(_origin == asker, "invalid paybackaddress");
              require(msg.value == (paybackAmount + contractFee), "invalid payback");
              debtPayedOff = true;
              originIsLender = false;
              originIsAsker = true;
          } else {
              revert("Error");
          }
      }


}
