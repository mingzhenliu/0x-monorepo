/*

  Copyright 2018 ZeroEx Intl.

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

import "./IERC20Token.sol";

/// 以太坊的中转封装合约，例如WETH，存入多少以太坊就可以取出多少WETH。退出多少WETH就可以拿出多少以太坊
contract IEtherToken is
    IERC20Token
{
  //存款
    function deposit()
        public
        payable;
  //退出 
    function withdraw(uint256 amount)
        public;
}
