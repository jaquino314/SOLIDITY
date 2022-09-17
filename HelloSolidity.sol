pragma solidity 0.5.16;

library SafeMath {
    function add(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
        c = _a + _b;
        assert(c >= _a);
        return c;
    }
}

contract MyFirstContract{
    using SafeMath for uint256;
    string public message = "Hello World!";
    address public wallet;
    uint public balance;
    address public payer;
    address public admin;

    struct deposit{
        uint256 amount;
        bool deposited;
    }

    mapping (address => deposit) public deposits;

    constructor() public{
        admin = msg.sender;
    }

    function helloWorld() public view returns (string memory){
        return message;
    }

    function setMessage(string memory _message) public{
        message = _message;
    }

    function setWallet(address _wallet) public{
        wallet = _wallet;
    }

    function payEther() public payable{
        deposits[msg.sender].amount = deposits[msg.sender].amount.add(msg.value);
        deposits[msg.sender].deposited = true;
        balance = balance.add(msg.value);
    }

    function withdrawEther() public{
        require(msg.sender == admin, "Not admin");
        address(msg.sender).transfer(balance);
        balance = 0;
    }

}