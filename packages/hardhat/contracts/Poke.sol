//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import IERC20 from OZ
////import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */
contract Poke {
    mapping(address => uint256) public pokes;
    function poke(uint256 input) public {
        pokes[msg.sender] = input;
        console.log("POKE",msg.sender,input);
    }
}