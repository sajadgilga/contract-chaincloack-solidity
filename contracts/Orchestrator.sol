// contracts/UrlEmitter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrlEmitter {
    string[] public urls;
    uint256 public currentIndex;

    event UrlEmitted(address indexed sender, string url);
    event UrlAdded(string url);

    constructor(string[] memory initialUrls) {
        require(initialUrls.length > 0, "Initial Nodes array must not be empty");
        urls = initialUrls;
        currentIndex = 0;
    }

    function emitNextNode() public {
        require(urls.length > 0, "No Nodes available");

        string memory nextUrl = urls[currentIndex];
        emit UrlEmitted(msg.sender, nextUrl);

        currentIndex = (currentIndex + 1) % urls.length;
    }
    
    function addNode(string memory newUrl) public {
        require(bytes(newUrl).length > 0, "URL must not be empty");
        urls.push(newUrl);
        emit UrlAdded(newUrl);
    }
}