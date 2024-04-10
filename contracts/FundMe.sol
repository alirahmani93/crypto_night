// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./priceConverter.sol";

error NotOwner();


contract FundMe{
    using PriceConverter for uint256;

    uint256 public constant MINUSD= 5 * 1e18; //  constant will reduce 2000 gas
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFuncded; 

    address  public immutable i_owner; //  immutable will reduce 2000 gas

    constructor() {
        i_owner = msg.sender;
    }


    function fund() public payable {
        require(msg.value.getConversionRate() >= MINUSD, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFuncded[msg.sender] = addressToAmountFuncded + msg.value;
    }

    function withdraw() public onlyOwner {

        for (uint256 funderIndex = 0; funderIndex < funders.length;funderIndex ++){
            addres funder = funders[funders];
            addressToAmountFuncded[funder] = 0;
        }

        funders= new address[](0); // Reset Array
        
        // sending ETH methods: transfer, send, call
 
        //transfer
        // payable(msg.sender).transfer(address(this).balance);
 
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
 
        // call
        (bool callSuccess,) = payable(msg.sender).call{value:address(this.balance)("")};
        require(callSuccess,"call fialed");
    }

    modifier  onlyOwner() {
        require(msg.sender == i_owner,"sender is not owner");
        _;
    }
    modifier  onlyOwnerCustomError() { // usable intead onlyOwner with custom error msg
        if (msg.sender != i_owner){revert NotOwner();}
        _;
    }
    
    // return every transact to fund() method .. and check them with less pay gas fee
    receive() external payable { 
        fund();
    }

    fallback() external payable {}{ 
        fund();
    }

}