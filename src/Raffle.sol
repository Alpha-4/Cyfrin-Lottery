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

    /*Events here */
    event RaffleJoined(address indexed player);

    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;

    constructor(uint256 _entranceFee, uint256 _interval) {
        i_entranceFee = _entranceFee;
        i_interval=_interval;
        s_lastTimeStamp= block.timestamp;
    }

    function enterRaffle() external {
        //require(msg.value >= i_entranceFee,"Amount is less than the entranceFee");//Not gas efficient as String has to be stored
        //require(msg.value >= i_entranceFee, NotEnoughEth()); //Still not gas efficient and valid on new verions
        if(msg.value < i_entranceFee) revert Raffle__NotEnoughEth();
        s_players.push(payable(msg.sender));
        
        emit RaffleJoined(msg.sender); 
    }

    function pickWinner() external {
        if(block.timestamp - s_lastTimeStamp > i_interval){

        }
    }

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
