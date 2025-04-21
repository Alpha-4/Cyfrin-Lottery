// SPDX-License-Identifier: SEE License in License
pragma solidity 0.8.19;

/**
    @title A Sample Raffle contract
    @author Arun
    @notice This is just a sample contract for learning
 */
contract Raffle {
    /*Errors here */
    Error Raffle__NotEnoughEth();

    uint256 private immutable i_entranceFee;

    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enterRaffle() public {
        //require(msg.value >= i_entranceFee,"Amount is less than the entranceFee");//Not gas efficient as String has to be stored
        //require(msg.value >= i_entranceFee, NotEnoughEth()); //Still not gas efficient and valid on new verions
        if(msg.value < i_entranceFee) revert Raffle__NotEnoughEth();
    }

    function pickWinner() public {}

    function getEntranceFee() public returns (uint256) {
        return i_entranceFee;
    }
}
