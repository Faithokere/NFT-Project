//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//the aim of an autocount smart contract is to keep track of the ID of each NFT that is minted
contract nft is ERC721,Ownable{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    constructor() ERC721("Mike NFT", "MNT"){}
    
    function _baseURI() internal pure override returns(string memory){
        return "https://ipfs.io/ipfs/QmRPtLrRmLtWGDCNeE2Wppx9dNBKBFZRE95D4nhtwsujLZ?filename=metadata.json/";
    }

    function safeMint(address to) public onlyOwner{
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

}
