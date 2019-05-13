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

import "@0x/contracts-utils/contracts/src/SafeMath.sol";
import "./UnlimitedAllowanceERC20Token.sol";

// 铸造
// 这里应该是没有用到，要不然的话没有权限控制，会乱透了
// 要不就是继承后再改写此接口，变成有权限
contract MintableERC20Token is 
    SafeMath,
    UnlimitedAllowanceERC20Token
{
    /// @dev Mints new tokens
    /// @param _to Address of the beneficiary that will own the minted token
    /// @param _value Amount of tokens to mint
    // 增发
    function _mint(address _to, uint256 _value)
        internal
    {
        balances[_to] = safeAdd(_value, balances[_to]);
        _totalSupply = safeAdd(_totalSupply, _value);

        emit Transfer(
            address(0),
            _to,
            _value
        );
    }

    /// @dev Mints new tokens
    /// @param _owner Owner of tokens that will be burned
    /// @param _value Amount of tokens to burn
    /// 减少
    function _burn(address _owner, uint256 _value)
        internal
    {
        balances[_owner] = safeSub(balances[_owner], _value);
        _totalSupply = safeSub(_totalSupply, _value);

        emit Transfer(
            _owner,
            address(0),
            _value
        );
    }
}
