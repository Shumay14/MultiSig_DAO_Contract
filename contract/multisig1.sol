pragma solidity 0.8.6;

contract mulisig {
    
    address[3] public ownersArr = [0x9EC9AC831FA8D419FDBf2789CaDe45A79689Ffb7, 0x46cf36F0dea6158F5cA9540ad0cEcaE1bBECfd09, 0xE63a104874b11a32EA8E74C427248CE82342A6d4];
    mapping(address => bool) public signs;
    uint public agreeCount = 0;
    mapping(address => uint) public balanceOf;
    uint public raisedAmount;

    
    // 참여계정 등록 최대 3개
    // function setAddress (address _address) public {
        
    //     require(ownersArr.length <= 3);
    //     ownersArr.push(_address);
    // }
    

    // 컨트랙트로 이더 전송 & 참여한 계정만 보낼수 있음
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

    

    // 투자대상으로 이더 전송
    // + 2명이상 동의시 전송 가능
    function withdraw (address beneficiary, uint withdraw_amount) public {
        require(agreeCount >= 2);
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }
