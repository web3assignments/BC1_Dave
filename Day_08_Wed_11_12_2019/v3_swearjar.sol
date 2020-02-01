pragma solidity >=0.5.2;

contract swearJar {
    uint badWords;

    function Insults_Today(uint x) public payable {
      //this is the function that let users decide what their fine should be for swearing
        badWords = x;
    }

    function My_Total_Insults() public view returns (uint) {
      //this let the user see all their insults so far
        return badWords;
    }
  
    function What_Did_Swearing_Cost_Me() public view returns (uint256) {
      //this let the user see all the fines the user paid
        return address(this).balance;
    }
  
}
