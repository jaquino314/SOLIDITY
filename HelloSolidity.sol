pragma solidity 0.5.16;

interface IMyFirstContract{
    function myFirstFunction() external pure returns (string memory);
}

contract MyFirstContract is IMyFirstContract{
    function myFirstFunction() public pure returns (string memory){
        return "Hello Solidity!";
    }

}