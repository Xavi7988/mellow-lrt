// SPDX-License-Identifier: BSL-1.1
pragma solidity ^0.8.0;

import "../../interfaces/modules/erc20/IERC20TvlModule.sol";

contract ERC20TvlModule is IERC20TvlModule {
    function tvl(
        address vault,
        bytes memory
    )
        external
        view
        returns (address[] memory tokens, uint256[] memory amounts)
    {
        tokens = IVault(vault).underlyingTokens();
        amounts = new uint256[](tokens.length);
        for (uint256 i = 0; i < tokens.length; i++) {
            amounts[i] = IERC20(tokens[i]).balanceOf(vault);
        }
    }
}