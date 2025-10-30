SimpleVoting Smart Contract

<img width="1920" height="1020" alt="Screenshot 2025-10-30 121953" src="https://github.com/user-attachments/assets/621a5432-abd7-490a-aaa9-999385ff2928" />

##Here is the link to check the successfully deployed smart contract-https://celo-alfajores.blockscout.com/address/0x1cdA9584e3Ace8cC238b81EDebD1f47654c3dFC7


🗳️ SimpleVoting Smart Contract

A simple and secure Ethereum smart contract that implements a single-round, one-vote-per-user voting system. Built using Solidity 0.8.x, this contract allows the owner to create proposals and participants to vote for one of them — ensuring fairness, transparency, and immutability.

📋 Table of Contents

Overview

Features

How It Works

Contract Structure

State Variables

Modifiers

Events

Functions

Usage Example

Security Considerations

Deployment

License

🧠 Overview

The SimpleVoting contract enables a decentralized election process where:

The contract owner can create multiple proposals.

Each participant (unique wallet address) can cast only one vote.

Votes are publicly visible and immutable once cast.

This is ideal for small elections, community decisions, or DAO-style governance systems where fairness and simplicity are key.

✨ Features

✅ Single Round Voting:
Each participant can vote once during the election.

✅ Owner-Managed Proposals:
Only the contract owner can add proposals, ensuring control over the election setup.

✅ Transparent Tally:
Votes are stored on-chain, making results verifiable by anyone.

✅ Immutable Ledger:
Once a vote is cast, it cannot be changed or deleted.

✅ Lightweight Design:
Minimal gas usage and easy to integrate with front-end DApps.

⚙️ How It Works

Deployment:

The person deploying the contract automatically becomes the owner.

Adding Proposals:

The owner can add any number of proposals using addProposal(string memory _name).

Voting:

Each address can vote once using vote(uint256 _proposalIndex).

The vote is recorded and linked to the voter’s address.

Results:

Anyone can view the number of proposals and their respective vote counts.

🧩 Contract Structure
🏛️ State Variables
Variable	Type	Description
owner	address	Address of the contract deployer (admin).
proposals	Proposal[]	Dynamic array storing all proposals.
hasVoted	mapping(address => bool)	Tracks whether an address has voted.
📦 Structs
Proposal
Field	Type	Description
name	string	The name or description of the proposal.
voteCount	uint256	The total number of votes received.
🔒 Modifiers
onlyOwner

Restricts access to specific functions (like adding proposals) so only the contract owner can call them.

modifier onlyOwner() {
    require(msg.sender == owner, "Caller is not the owner");
    _;
}

📢 Events
Event	Parameters	Description
ProposalAdded	uint256 proposalIndex, string name	Emitted when a new proposal is added.
Voted	address voter, uint256 proposalIndex	Emitted when a user successfully casts a vote.
🧮 Functions
constructor()

Sets the deployer as the contract owner.

addProposal(string memory _name)

Access: Only Owner

Description: Adds a new proposal with the given name.

Emits: ProposalAdded

vote(uint256 _proposalIndex)

Access: Public

Description: Allows a user to vote for a proposal (once per address).

Emits: Voted

getProposalCount()

Returns: The total number of proposals.

Type: view

checkHasVoted(address _voter)

Returns: true if the address has already voted, false otherwise.

Type: view

🧪 Usage Example
1️⃣ Deploy Contract

Deploy SimpleVoting.sol using Remix IDE, Hardhat, or Foundry.
The deployer automatically becomes the owner.

2️⃣ Add Proposals
addProposal("Alice for President");
addProposal("Bob for President");

3️⃣ Cast Votes
vote(0); // Vote for "Alice"

4️⃣ Check Votes
getProposalCount(); // Returns total proposals
checkHasVoted(0xYourAddress); // Returns true or false

🔐 Security Considerations

One Vote per Address: Enforced via hasVoted mapping.

Owner Privileges: Only the owner can create proposals.

Immutable Votes: Once cast, votes cannot be changed or deleted.

No End Date: The contract doesn’t enforce a voting deadline — can be added as an enhancement.

Sybil Protection: No built-in mechanism to prevent multiple wallets per user (off-chain verification may be needed).

🚀 Deployment
Using Remix IDE

Go to Remix
.

Create a new file SimpleVoting.sol and paste the contract code.

Compile using Solidity version ^0.8.0.

Deploy on:

Remix VM (local) for testing, or

Injected Provider (e.g., MetaMask) for real Ethereum networks.

Using Hardhat
npx hardhat compile
npx hardhat run scripts/deploy.js --network sepolia

🪄 Possible Enhancements

Add a voting deadline or start/end time.

Allow the owner to close voting and announce results.

Implement weighted voting (based on tokens or roles).

Enable voter registration lists to restrict who can vote.

📜 License

This project is licensed under the MIT License.
See the LICENSE
 file for more details.

Author: [Your Name or GitHub Handle]
Version: 1.0
Solidity Compiler: ^0.8.0
