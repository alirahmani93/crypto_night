// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

constant FallbackExmaple{

    uint256 public result;

    receive() external payable { // do it when transact without calldata
        result =1;
    }

    fallback() external payable {}{ // do it when transact with calldata is not found
        result=2;
    }

}