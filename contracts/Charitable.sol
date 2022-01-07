// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./StringUtils.sol";

contract Charitable {
    using StringUtils for string;
    uint256 transactionCount;
    uint256 applicantsCount;

    struct Applicant {
        string id;
        string fullname;
        address applicantAddress;
    }

    Applicant[] applicants;

    event NewApplicant(string id, string fullName, address applicantAddress);

    struct TransferStruct {
        address from;
        address to;
        uint256 amount;
        uint256 timestamp;
        string message;
    }

    TransferStruct[] transactions;

    event NewTransaction(
        address from,
        address to,
        uint256 amount,
        uint256 timestamp,
        string message
    );

    function getAllApplicants() public view returns (Applicant[] memory) {
        return applicants;
    }

    function getApplicant(string memory _id) public returns (Applicant memory) {
        for (uint256 i = 0; i < applicantsCount; i++) {
            if (StringUtils.equal(applicants[i].id, _id)) {
                return applicants[i];
            } else {
                revert("Not found");
            }
        }
    }

    function getApplicantsCount() public view returns (uint256) {
        return applicantsCount;
    }

    function newApplicant(
        string memory _id,
        string memory _fullName,
        address _applicantAddress
    ) public {
        applicantsCount++;
        applicants.push(Applicant(_id, _fullName, _applicantAddress));
        emit NewApplicant(_id, _fullName, _applicantAddress);
    }

    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }

    function newTransaction(
        address payable applicant,
        uint256 amount,
        string memory message
    ) public {
        transactionCount++;
        transactions.push(
            TransferStruct(
                msg.sender,
                applicant,
                amount,
                block.timestamp,
                message
            )
        );
        emit NewTransaction(
            msg.sender,
            applicant,
            amount,
            block.timestamp,
            message
        );
    }
}
