pragma solidity 0.8.6;

contract mulisig {
    
    address[] public ownersArr;
    mapping(address => bool) public signs;
    uint agreeCount = 0;
    mapping(address => uint) public balanceOf;
    uint raisedAmount;

    
    // 참여계정 등록 최대 3개
    function setAddress (address _address) public {
        
        require(ownersArr.length <= 3);
        ownersArr.push(_address);
    }
    

    // 컨트랙트로 이더 전송 & 참여한 계정만 보낼수 있음
    function sendEther (uint amount) public payable {
        
        bool check = false;

        for (uint i = 0; i < ownersArr.length; i++) {
            if (ownersArr[i] == msg.sender) {
                balanceOf[msg.sender] += amount;
                raisedAmount += amount; 
                check = true;

            } else if(ownersArr[i] != msg.sender){
               
            }
        }

        if (check == false) {
            revert("Your address is not allowed. First of all, set your address.");
        }
    }

    function signAgree (bool _answer) {
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


    // 참여 계정수에 따라 과반수 동의 조건 다름
    // function agreeNum () {
    //     if (ownersArr.length == 3 && agreeCount >= 2) {

    //         withdraw();
    //     }
    //     else if (ownerArr.length == 2 && agreeCount >= 1) {
    //         withdraw();
    //     }
    //     else if (ownerArr.length == 1 && agreeCount == 1) {
    //         withdraw();
    //     } 
    // }

    

    // 투자대상으로 이더 전송
    // + 2명이상 동의시 전송 가능
    function withdraw (address beneficiary, uint withdraw_amount) public {
        require(agreeCount >= 2);
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }

    
}