pragma solidity 0.8.6;

contract Validator {
    function validate(uint) external returns(bool) {
        
    }
}

contract TypeSafeSend {
    // validate
    function validateSend(Validator _validator, uint _value) internal returns(bool) {
        bool valid = _validator.validate(_value);
        return valid;
    }
}