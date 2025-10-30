SimpleVoting Smart Contract

<img width="1920" height="1020" alt="Screenshot 2025-10-30 121953" src="https://github.com/user-attachments/assets/621a5432-abd7-490a-aaa9-999385ff2928" />

##Here is the link to check the successfully deployed smart contract-https://celo-alfajores.blockscout.com/address/0x1cdA9584e3Ace8cC238b81EDebD1f47654c3dFC7


A basic, single-round voting contract implemented in Solidity. It allows the contract owner to propose items for a vote, and any user to cast a single, non-reversible vote for one of the proposals.

License and Version

License: MIT

Solidity Version: ^0.8.0

Features

Owner Control: Only the contract owner can add new proposals.

One Vote Per Address: Each unique address can vote only once.

Proposal Tracking: Stores the name and vote count for each proposal.

Read-Only Access: Public view functions to check the current state (proposal counts, and whether an address has voted).

Contract Details

State Variables

Variable Name

Type

Visibility

Description

proposals

Proposal[]

public

An array holding all the voting options (proposals).

hasVoted

mapping(address => bool)

private

Tracks if a specific address has already cast a vote (true if they have).

owner

address

public

The address of the user who deployed the contract.

Structs

Proposal

Field

Type

Description

name

string

The descriptive name of the proposal.

voteCount

uint256

The total number of votes received for this proposal.

Modifiers

Modifier

Description

onlyOwner

Restricts function access, ensuring it can only be called by the owner address.

Functions

1. constructor()

Purpose: Initializes the contract.

Action: Sets the owner variable to the address that deploys the contract (msg.sender).

2. addProposal(string memory _name)

Purpose: Adds a new proposal to the voting list.

Visibility: public

Modifier: onlyOwner (Can only be called by the contract owner).

Parameters:

_name (string): The name or title of the proposal.

Emits: ProposalAdded event.

3. vote(uint256 _proposalIndex)

Purpose: Casts a vote for a selected proposal.

Visibility: public

Parameters:

_proposalIndex (uint256): The index (position in the array) of the proposal to vote for.

Requirements:

The _proposalIndex must be a valid index in the proposals array.

The calling address (msg.sender) must not have voted yet.

Action: Increments the voteCount for the specified proposal and marks the caller's address in hasVoted.

Emits: Voted event.

4. getProposalCount()

Purpose: Retrieves the total number of proposals available.

Visibility: public view

Returns: uint256 - The length of the proposals array.

5. checkHasVoted(address _voter)

Purpose: Checks the voting status of a specific address.

Visibility: public view

Parameters:

_voter (address): The address to check.

Returns: bool - true if the address has voted, false otherwise.

Events

ProposalAdded(uint256 indexed proposalIndex, string name): Notifies when a proposal is successfully added.

Voted(address indexed voter, uint256 indexed proposalIndex): Notifies when a vote is successfully cast.

Usage Example

Deployment: Deploy the SimpleVoting contract from the owner's address.

Add Proposals (Owner Only):

Call addProposal("Vote for Option A")

Call addProposal("Vote for Option B")
(These proposals will have indices 0 and 1, respectively).

Voting (Any User):

A user calls vote(0) to vote for "Option A".

The same user attempts to call vote(1) and the transaction is reverted with the error: "You have already voted".

Check Results (Any User):

Call the public getter for proposals(0) to see the current vote count for the first option.
