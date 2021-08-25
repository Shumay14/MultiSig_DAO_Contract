pragma solidity 0.8.6;

contract mulisig {
    
    address[3] public ownersArr = [0x9EC9AC831FA8D419FDBf2789CaDe45A79689Ffb7, 0x46cf36F0dea6158F5cA9540ad0cEcaE1bBECfd09, 0xE63a104874b11a32EA8E74C427248CE82342A6d4];
    mapping(address => bool) public signs;
    uint public agreeCount = 0;
    mapping(address => uint) public balanceOf;
    uint public raisedAmount;

    
    // enroll accounts address max 3
    // function setAddress (address _address) public {       
    //     require(ownersArr.length <= 3);
    //     ownersArr.push(_address);
    // }
    

    // send ether to contract & only allowed for enrolled accounts
    function sendEther () public payable {
        
        bool check = false;

        for (uint i = 0; i < ownersArr.length; i++) {
            if (ownersArr[i] == msg.sender) {
                balanceOf[msg.sender] += msg.value;
                raisedAmount += msg.value; 
                check = true;

            } else if(ownersArr[i] != msg.sender){
               
            }
        }

        if (check == false) {
            revert("Your address is not allowed. First of all, set your address.");
        }
    }

    function signAgree (bool _answer) public {
        // _answer = "true" or "false"
        
        for (uint i = 0; i < ownersArr.length; i++) {
            if (ownersArr[i] == msg.sender) {
                
                if (_answer == true) {
                    signs[msg.sender] = _answer;
                    agreeCount++;
                } else {
                    signs[msg.sender] = _answer;
                }

            } else if(ownersArr[i] != msg.sender) {
               
            } 
        }    
    }

    

    // send ether to beneficiary from contract
    // need more than 2 account agree for sending ether
    function withdraw (address beneficiary, uint withdraw_amount) public {
        require(agreeCount >= 2);
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }

    
}