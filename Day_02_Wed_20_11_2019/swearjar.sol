pragma solidity >=0.4.0 <0.7.0;

contract swearJar {
    uint badWords;
  
  //event idea: something that increases badwords count. 
  //No idea what to do with mapping though

    function Insults_Today(uint x) public payable {
      //this is the function that let users decide what their fine should be for swearing
      if( x > 1) { //Attemt at error handling with if/else
      badWords = x; 
      } else(){
      badWords ++;
      }
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
