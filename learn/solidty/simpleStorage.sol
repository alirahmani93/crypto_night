// SPDX-Licenses-Identifier: MIT
pragma solidity ^0.8.18; // Evrey Version after 0.8.18
// pragma solidity >=0.8.18 <0.9.0; // Evrey Version between

contract SimpleStorage{
    // bool, int, uint, addres, btype
    // bool hasFavoriteNumber = true;
    uint256 public favoritNumber ;
    // int256 favoritNumberUnSigned = -88;
    // string favoritNumberInText = "88";
    // // address myAddress = 0xaBa;
    // bytes32 favoritBytes32 = "cat"; // 0xs25a655
    uint256[] listOfNum;
    //index:   0 1  2
    //value: [23,34,45]

    struct Person {
        uint16 personFaveNumber;
        string name;
    }

    // Person public  myFriend = Person(7,"patrick");
    // Person public  myOtherFriend = Person({personFaveNumber:7,name:"patrick"});

    Person[] public  listOfPepole;  // Empty


    mapping(string => uint256 ) public nameToFaveNumber;

    function store(uint256 _faveNum) public {
         favoritNumber = _faveNum;
         retrive();
    }

    function retrive() public view  returns (uint256){
        return favoritNumber;
    }

    function addPerson(string  memory _name , uint16 _favenum) public {
        Person memory newPerson  = Person(_favenum, _name);
        listOfPepole.push(newPerson);
        nameToFaveNumber[_name] = _favenum;
    }
  
}   