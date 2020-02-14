pragma solidity ^0.5.0;

contract moneyRequest {
    address payable public asker;
    address payable public lender;
    bool public lentMoney;
    bool public debtPayedOff;
    uint256 public  amountRequested;
    uint256 public  paybackAmount;
    string public loanType;
    address payable private requestManager;
    bool private withdrawnByAsker;
    bool public withdrawnByLender;

    constructor(
        address payable asker,
        uint256 amountRequested,
        uint256 paybackAmount,
        string memory loanType,
        address payable requestManager

    ) public {
        asker = asker;
        amountRequested = amountRequested;
        paybackAmount = paybackAmount;
        loanType = loanType;
        requestManager = requestManager;
    }



   function deposit(address payable from) external payable returns(bool fromAsker, bool fromLender) {
      if (!lentMoney) {
         require(from != asker, "invalid lender");
         require(msg.value == amountRequested, "msg.value");
         lentMoney = true;
         lender = from;
         fromLender = true;
         fromAsker = false;
     } else if (lentMoney && !debtPayedOff) {
         require(from == asker, "invalid paybackaddress");
         require(msg.value == paybackAmount, "invalid payback");
         debtPayedOff = true;
         fromLender = false;
         fromAsker= true;
     } else {
         revert("Error");
     }
    }


    function withdraw(address from ) external {
        require(lentMoney, "invalid state");
        require(lender != address(0), "invalid lender");
        if (from == asker) {
            require(!debtPayedOff, "debt settled");
            withdrawnByAsker = true;
            asker.transfer(address(this).balance);
        } else if (from == lender) {
            if (!debtPayedOff) {
                require(!withdrawnByAsker, "WithdrawnByAsker");
                lentMoney = false;
                lender.transfer(address(this).balance);
                lender = address(0);
            } else {
                withdrawnByLender = true;
                lender.transfer(address(this).balance);
            }
        } else {
            revert("Error");
        }
    }
}
