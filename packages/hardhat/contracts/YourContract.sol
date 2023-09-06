//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
//import "hardhat/console.sol";

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import IERC20 from OZ
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */
contract YourContract {

	address public immutable tokenAddress;
	uint256 public immutable amount;

	// State Variables
	address public immutable owner;


	
	function exec(address addr, bytes memory data, uint256 value, uint256 gas) public payable {

		//require(msg.sender == owner, "Only owner can call this function.");

		//get my balance of eth 
		//uint256 ethBalance = address(this).balance;

		IERC20 daiToken = IERC20(tokenAddress);

		//get my balance of dai 
		uint256 daiBalanceOfOwner = daiToken.balanceOf(owner);

		 (bool success, bytes memory returndata) = addr.call{value: value, gas: gas}(
			data
            //abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

		uint256 daiDifferenceOfOwner = daiToken.balanceOf(owner)-daiBalanceOfOwner;

		require(daiDifferenceOfOwner >= amount, "Did not get enough DAI back");

		(bool success2, bytes memory returndata2) = msg.sender.call{value: address(this).balance}("");
	}

	function stupidExpensiveEncode(uint amountOut, address[] calldata path, address to, uint deadline) public pure returns (bytes memory) {
		return abi.encodeWithSignature("swapETHForExactTokens(uint256,address[],address,uint256)",amountOut,path,to,deadline);
	}

	receive() external payable {}

	// Constructor: Called once on contract deployment
	// Check packages/hardhat/deploy/00_deploy_your_contract.ts
	constructor(address _owner, address _tokenAddress, uint256 _amount) {
		owner = _owner;
		tokenAddress = _tokenAddress;
		amount = _amount;
	}

}
