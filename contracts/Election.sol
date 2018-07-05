pragma solidity ^0.4.2;

contract Election {
		// Model a candidate
		
		struct Candidate{
			uint id;
			string name;
			uint voteCount;
		}
		//Store accounts that have voted
		mapping(address => bool) public voters; 
		// Store candidate
		// Fetch candidate 
		mapping(uint => Candidate) public candidates; //Cant iterate/find length
		//Store candidate count
		uint public candidatesCount; //will have to explicitly keep a count of number of candidates

		event votedEvent (
        uint indexed _candidateId
    );


		function Election() public {

			addCandidate("Modiji");
			addCandidate("Rahul");

		}

		function addCandidate(string _name) private {
			candidatesCount++;
			candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);//0 for voteCount

		}

		function vote (uint _candidateId) public {
			//require that they haven't voted before

			require(!voters[msg.sender]);

			//require a valid candidate

			require(_candidateId > 0 && _candidateId <= candidatesCount);


			//record that voter has voted
			voters[msg.sender] = true;

			//update candidate voteCount
			candidates[_candidateId].voteCount++;

			//trigger the votedEvent
			votedEvent(_candidateId);
		}
}