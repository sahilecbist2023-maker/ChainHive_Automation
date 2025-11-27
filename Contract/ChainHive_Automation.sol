// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Project {
    struct Task {
        string description;
        bool completed;
        address creator;
    }

    uint256 public taskCount;
    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 indexed taskId, address indexed creator, string description);
    event TaskCompleted(uint256 indexed taskId, address indexed completer);

    function createTask(string calldata _description) external {
        taskCount++;
        tasks[taskCount] = Task({
            description: _description,
            completed: false,
            creator: msg.sender
        });
        emit TaskCreated(taskCount, msg.sender, _description);
    }
}
