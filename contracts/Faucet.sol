// SPDX-License-Identifier:  MIT
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Faucet is Ownable {
    address public _owner;
    mapping(uint256 => IERC20) private _tokens;
    uint256 public tokenCounts;


    function getToken(uint256 _index) public view returns(IERC20){
        return _tokens[_index];
    }

    function addNewToken(string memory _name, string memory _symbol) public onlyOwner returns(uint256 newIndex){
        newIndex = tokenCounts;
        IERC20 newToken = new ERC20(_name , _symbol);
        _tokens[newIndex] = newToken;
        tokenCounts += 1;
    }
    

}