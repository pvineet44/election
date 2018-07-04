pragma solidity ^0.4.2;

contract Election {
		// Model a candidate
		
		struct Candidate{
			uint id;
			string name;
			uint voteCount;
		}

		// Store candidate
		// Fetch candidate 
		mapping(uint => Candidate) public candidates; //Cant iterate/find length
		//Store candidate count
		uint public candidatesCount; //will have to explicitly keep a count of number of candidates


		function Election() public {

			addCandidate("Modiji");
			addCandidate("Rahul");

		}

		function addCandidate(string _name) private {
			candidatesCount++;
			candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);//0 for voteCount

		}
}