pragma solidity 0.8.6;

contract mulisig {
    
    address[] public ownersArr;
    uint agreeCount = 0;
    uint raisedAmount;
    uint deadline;
    uint period;

    mapping(address => bool) public signs;
    mapping(address => uint) public balanceOf;


    // set fundable period
    function setPeriod (uint _period) public {
        

        period = _period * days
        deadline = block.timestamp + period;
    }

    // close pool
    function closePool () public {
        bool opened = true;

        if (block.timestamp < deadline) {
            opened = true;
        }
        else if (block.timestamp >= deadline) {
            opened = false;
            ownersArr != msg.sender;
        }
    } 
    

    
    // enroll accounts address max 3
    function setAddress (address _address) public {
        
        require(ownersArr.length <= 3);
        ownersArr.push(_address);
    }
    

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
        // _answer = true or false
        
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
    // need more than 2 accounts agree for sending ether
    function withdraw (address beneficiary, uint withdraw_amount) public {
        require(agreeCount >= 2);
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }

    
}