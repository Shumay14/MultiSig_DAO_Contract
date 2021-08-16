pragma solidity 0.8.6;

contract mulisig {
    
    address[] public ownersArr;
    mapping(address => bool) public signs;
    uint agreeCount = 0;    
    
    // 참여계정 등록 최대 3개
    function setaddress (address _address) public {
        
        require(ownersArr.length <= 3);
        ownersArr.push(_address);
    }
    

    // 컨트랙트로 이더 전송
    function sendether () public payable {
        
        for (uint i = 0; i < ownersArr.length; i++) {
            if (ownersArr[i] == msg.sender) {

            }
        }
    }

    function signing (bool _answer) {
        signs[msg.sender] = _answer

        if (signs == true) {
            agreeCount++;
        }
        else {

        }
        
        
    }

    function agrees () {
        if (ownersArr.length == 3 && agreeCount >= 2) {

            withdraw();
        }
        else if (ownerArr.length == 2 && agreeCount >= 1) {
            withdraw();
        }
        else if (ownerArr.length == 1 && agreeCount == 1) {
            withdraw();
        } 
    }

    

    // 투자대상으로 이더 전송
    // + 2명이상 동의시 전송 가능
    function withdraw (address beneficiary, uint withdraw_amount) internal {
        require(address(this).balance >= withdraw_amount);
        payable(beneficiary).transfer(withdraw_amount);
        
    }

    
}