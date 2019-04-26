/*

  Copyright 2019 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.5.5;
pragma experimental "ABIEncoderV2";

import "@0x/contracts-exchange-libs/contracts/src/LibExchangeSelectors.sol";
import "@0x/contracts-exchange-libs/contracts/src/LibOrder.sol";
import "@0x/contracts-utils/contracts/src/LibBytes.sol";


contract LibTransactionParser is LibExchangeSelectors {
    using LibBytes for bytes;

    function parseTransaction(bytes memory signedTransactionData)
        public
        pure
        returns (
            string memory functionName,
            LibOrder.Order[] memory orders,
            uint256[] memory takerAssetFillAmounts,
            bytes[] memory signatures
        )
    {
        bytes4 functionSelector = signedTransactionData.readBytes4(0);
        if (functionSelector == FILL_ORDER_SELECTOR) {
            functionName = "fillOrder";
            orders = new LibOrder.Order[](1);
            takerAssetFillAmounts = new uint256[](1);
            signatures = new bytes[](1);
            (orders[0], takerAssetFillAmounts[0], signatures[0]) = abi.decode(
                signedTransactionData.slice(4, signedTransactionData.length),
                (
                    LibOrder.Order,
                    uint256,
                    bytes
                )
            );
        } else if (functionSelector == CANCEL_ORDER_SELECTOR) {
            functionName = "cancelOrder";
            orders = new LibOrder.Order[](1);
            takerAssetFillAmounts = new uint256[](0);
            signatures = new bytes[](0);
            orders[0] = abi.decode(
                signedTransactionData.slice(4, signedTransactionData.length),
                (LibOrder.Order)
            );
        } else {
            revert("Unrecognized function selector");
        }
    }
}
