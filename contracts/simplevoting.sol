// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SimpleVoting
 * @dev A basic smart contract for managing a single-round, one-vote-per-user election.
 */
contract SimpleVoting {

    // --- State Variables ---

    // Struct to hold information about a proposal
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    // Array to store all the proposals
    Proposal[] public proposals;

    // Mapping to track which addresses have already voted (prevents double voting)
    mapping(address => bool) private hasVoted;

    // The address that deployed the contract (owner)
    address public owner;

    // --- Events ---

    // Event emitted when a new proposal is added
    event ProposalAdded(uint256 indexed proposalIndex, string name);

    // Event emitted when a vote is successfully cast
    event Voted(address indexed voter, uint256 indexed proposalIndex);

    // --- Modifiers ---

    // Restricts a function to be callable only by the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // --- Constructor ---

    /**
     * @dev Sets the contract creator as the initial owner.
     */
    constructor() {
        owner = msg.sender;
    }

    // --- Core Functions ---

    /**
     * @dev Adds a new proposal to the list.
     * @param _name The name or description of the proposal.
     */
    function addProposal(string memory _name) public onlyOwner {
        proposals.push(Proposal({
            name: _name,
            voteCount: 0
        }));
        emit ProposalAdded(proposals.length - 1, _name);
    }

    /**
     * @dev Allows an address to cast a vote for a specific proposal.
     * @param _proposalIndex The index of the proposal in the 'proposals' array.
     */
    function vote(uint256 _proposalIndex) public {
        // 1. Check if the proposal index is valid
        require(_proposalIndex < proposals.length, "Invalid proposal index");

        // 2. Check if the user has already voted
        require(!hasVoted[msg.sender], "You have already voted");

        // 3. Cast the vote
        proposals[_proposalIndex].voteCount += 1;

        // 4. Mark the user as having voted
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, _proposalIndex);
    }

    // --- View Functions (Read-only) ---

    /**
     * @dev Retrieves the total number of proposals.
     * @return The number of proposals.
     */
    function getProposalCount() public view returns (uint256) {
        return proposals.length;
    }

    /**
     * @dev Checks if a specific address has voted.
     * @param _voter The address to check.
     * @return True if the address has voted, false otherwise.
     */
    function checkHasVoted(address _voter) public view returns (bool) {
        return hasVoted[_voter];
    }
}

