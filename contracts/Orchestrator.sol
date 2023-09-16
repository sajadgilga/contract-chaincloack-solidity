// contracts/UrlEmitter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrlEmitter {
    string[] public urls;

    event UrlEmitted(string url);

    constructor(string[] memory initialUrls) {
        urls = initialUrls;
    }

    function emitRandomUrl() public {
        require(urls.length > 0, "No URLs available");
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % urls.length;
        string memory randomUrl = urls[randomIndex];
        emit UrlEmitted(randomUrl);
    }
}