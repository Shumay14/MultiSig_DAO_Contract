pragma solidity ^0.4.19;

contract HelloWorld {
    string private stateVariable = "Hello World";
    uint private simpleInt;
    
    function GetHelloWorld() public view returns (string) {
        return stateVariable;

    }

    function getValue() public view returns (uint) {
        return simpleInt;
    }

    function setValue(uint _value) public {
        simpleInt = _value;
    }
}


contract client {
    function useNewKeyword() public returns (uint) {
        HelloWorld myObj = new HelloWorld();

        myObj.setValue(10);

        return myObj.getValue();
    }
}


// contract structure

// definition of contract
contract GeneralStructure {
    // state variable
    int public stateIntVariable;    // 정수형 변수
    string stateStringVariable;     // 문자열 변수
    address personIdentifier;       // 주소형 변수
    myStruct human;                 // 구조체 변수
    bool constant hasIncome = true; // 상수의 성질을 갖는 변수

    // def. structure
    struct myStruct {
        string name;
        unit myAge;                     // 부호 없는 정수형 변수
        bool isMarried;
        uint[] bankAccountsNumbers;     // 변수; 부호 없는 정수의 동적 배열
    }

    // declaration of modifier
    modifier onlyBy() {
        if (msg.sender == personIdentifier) {
            _;
        }
    }


    // dec. event
    event ageRead(address, int);

    // dec. enumeration
    enum gender {male, female};


    // dec. function
    function getAge(address _personIdentifier) onlyBy() payble exteranl returns (uint) {
        human = myStruct("Ritesh", 10, true, new uint[] (3));   // myStruct 구조체 사용

        gender _gender = gender.male;   // 열거형 사용

        ageRead(presonIdentifier, stateIntVariable);
    }
}

