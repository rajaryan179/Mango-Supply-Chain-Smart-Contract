//SPDX-License-Identifier: Unlicensed

pragma solidity ^0.6.0;

contract MangoSupplyChain {
  // Mango properties
  string public name;
  string public origin;
  uint public price;

  // Mango owner
  address public owner;

  // Mango purchase information
  address public purchaser;
  uint public purchaseTime;

  // Constructor
  constructor(string memory _name, string memory _origin, uint _price) public {
    owner = msg.sender;
    name = _name;
    origin = _origin;
    price = _price;
  }

  // Purchase function
  function purchase() public payable {
    require(msg.value == price, "Incorrect price paid");
    require(purchaser == address(0), "Mango has already been purchased");
    purchaser = msg.sender;
    purchaseTime = now;
  }

  // Cancel purchase function
  function cancelPurchase() public {
    require(purchaser == msg.sender, "Only the purchaser can cancel the purchase");
    purchaser = address(0);
    purchaseTime = 0;
  }
}
