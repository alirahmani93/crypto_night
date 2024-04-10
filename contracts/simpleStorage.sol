pragma solidity ^0.8.18;

contract SimpleStorage {
    string public Name;
    address public Address;
    int16 public Age;
    string public code;


    struct Person{
        string public firstName;
    }

    Person[] public friends;

    function showName()  public view returns(string) {

        return Name;
    }
    
    function showAge() public view  returns (uint16){
        return Age;
    }

    function addFriend(string _firstName) public{
        friends.push
        
    }

}