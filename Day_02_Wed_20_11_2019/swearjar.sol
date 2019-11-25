//defines soliditys version
pragma solidity >=0.4.0 <0.7.0; 
//starts the swearJar contract
contract swearJar { 
    
    struct swearStruct { //makes a struct that stores the swearer, amount of badWords and the badWordsFine
 //       address swearer; //this should be the msg.sender 
        uint badWords; //is an integer that counts up
        uint badWordsFine; //is an integer that counts up
    }
    
    mapping(address => swearStruct) swearMapping;   //mapping that accepts the key we defined and that value will be the struct defined above, so that we can easily look up the swearer and see his badwords and his fine
    address[] public swearAccounts;                    //this is an array that stores all our swearers addresses 
    
    //This function adds swearers to the swearMapping
    function setSwearer(address _address, uint _badWords, uint _badWordsFine) public {
        swearStruct storage swearer = swearMapping[_address];
        swearer.badWords = _badWords;
        swearer.badWordsFine = _badWordsFine;
        swearAccounts.push(_address) -1;
    }
    
    //this function retrieves a list of addresses from swearAccounts
    function getSwearAccounts()  public view returns (address[] memory){
        return  swearAccounts;
    }
    
    uint badWords;
  
  //event idea: something that increases badwords count. 
  //No idea what to do with mapping though

    function Insults_Today(uint x) public payable {
      //this is the function that let users decide what their fine should be for swearing
      if( x > 1) { //Attemt at error handling with if/else
      badWords = x; 
      } else{
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
