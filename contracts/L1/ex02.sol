// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/IStarknetCore.sol";

contract ex02 is Ownable {

    address public starknetContractAddress;
    uint256 public Ex2Selector;
    uint256 public EvaluatorContractAddress;

    function setStarknetContractAddress(address _address) 
        external 
        onlyOwner 
    {
        starknetContractAddress = _address;
    }


    function setEx2Selector(uint256 _selector) 
        external 
        onlyOwner 
    {
        Ex2Selector = _selector;
    }

    function setEvaluatorContractAddress(uint256 _evaluatorContractAddress)
        external
        onlyOwner
    {
        EvaluatorContractAddress = _evaluatorContractAddress;
    }

    function mintNftOnL2(uint256 l2_user) 
        public 
    {
        uint256[] memory payload = new uint256[](1);
        payload[0] = l2_user;
        IStarknetCore(starknetContractAddress).sendMessageToL2(
            EvaluatorContractAddress,
            Ex2Selector,
            payload
        );
    }
}