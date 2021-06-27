//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

//Interface to IEther from Yearn, to invest ETH
interface IIEther {
  // Invest ETH
  function invest() external payable;
  function calcPoolValueInETH() external view returns (uint);
  function getPricePerFullShare() external view returns (uint);
  /// Redeem any invested tokens from the pool
  function redeem(uint256 _shares) external;
}

contract Vault is ReentrancyGuard, Ownable {
    //variables
    mapping (address => uint256) internal _userToShares;

    constructor() Ownable() ReentrancyGuard() {}

    //Creating an instance of the IEther contract
    IIEther IEther =  IIEther(0x9Dde7cdd09dbed542fC422d18d89A589fA9fD4C0);


    //###############
    // Registry of shares
    //###############


    //###############
    // Finance functions
    //###############

    function deposit(uint256 amount) external {
        _userToShares[msg.sender] =  amount;
    }

    function balanceOf ()  external view returns(uint256)
    {
        return _userToShares[msg.sender];
    }

} 