pragma solidity 0.8.6;

contract mulisig {
    
    address[] public ownersArr;
    
    
    
    function setaddress (address _address) public {
        
        require(ownersArr.length <= 3);
        ownersArr.push(_address);
    }
    
    function sendether () public payable {
        
        for (uint i = 0; i < ownersArr.length; i++) {
            if (ownersArr[i] == msg.sender) {
            }
        }
    }
    
    function withdraw (address beneficiary, uint withdraw_amount) public {
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }
}