// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage , Ownable{

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    constructor() ERC721("Gaura Web Tech","GWT"){}

    function mintNFT(address _recipient, string memory _tokenURI) public returns(uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(_recipient, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        return newItemId;
    }
    
    function mintMultipleNFT(address _recipient, string memory _tokenURI, uint _amount) public returns(uint[] memory _Ids)
    {
        uint[] memory Ids=new uint[](_amount);
        for(uint i=0;i<_amount;i++)
        {
            Ids[i]=mintNFT(_recipient,_tokenURI);
        }
        return Ids;
    }
    
}



