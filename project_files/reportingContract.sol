pragma solidity ^0.6.3;
// Use this file for your reporting contract.
contract ReportingContract { 
  // These will be the address of your validator0 and validator1 nodes
  address[] public validators = [0x1Dda6682821E90Ce8dED5973cee3D7af5aC6FdF6,0x2D76fccc37E5142F20b4d8c210ca549e66f02936]; 
  mapping(address => uint) indices; 
  address public disliked; 
 
  constructor() public { 
    for (uint i = 0; i < validators.length; i++) { 
      indices[validators[i]] = i; 
    } 
  } 
 
  // Called on every block to update node validator list. 
  function getValidators() public view returns (address[] memory) { 
    return validators; 
  } 
 
  // Expand the list of validators. 
  function addValidator(address validator) public { 
    validators.push(validator); 
  } 
 
  // Remove a validator from the list. 
  function reportMalicious(address validator) public { 
    validators[indices[validator]] = validators[validators.length-1]; 
    delete indices[validator]; 
    delete validators[validators.length-1]; 
  } 
 
  function reportBenign(address validator) public { 
    disliked = validator; 
  } 
}
