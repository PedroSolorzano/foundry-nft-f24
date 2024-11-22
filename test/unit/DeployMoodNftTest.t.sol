// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToURI() public view {
        string
            memory expectedURI = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPiBoaSEgWW91ciBicm93c2VyIGRlY29kZWQgdGhpcyEgPC90ZXh0Pjwvc3ZnPg==";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black"> hi! Your browser decoded this! </text></svg>';
        string memory actualURI = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualURI)) ==
                keccak256(abi.encodePacked(expectedURI))
        );
    }
}
