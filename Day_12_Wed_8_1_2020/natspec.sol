
/* 
Project: Smartcontract Gemeente Den Haag
Owner: E.M. Roelofsen (Externe HHS Student)
Status: Alpha (no security checks or whatsoever)
*/

///@title a program for the Gemeente Den Haag
///@author Evert M. Roelofsen
///@notice this is still very basic
///@dev all function work except the last three

contract schuldHulpVerlening {
    address public schuldHulpVerlener; /* This is the way in which we initialize the variable in our contract called schuldHulpVerlener, that holds a value of type address, and it has a public access property, which means an api, or a WebApp can read it. */
    address[] public debiteur; /* This is a variable named debiteur, that references a dynamic array of addresses, which also has public access, so other smart contracts or apis can read the participants in this array. */
    address[] public derdePartij; //this function isn't used for now; will be developed in Beta version.
    
    bool geschiktVoorSchuldHulpVerlening;
    bool krijgtSchuldHulpVerlening;
    
    modifier schuldHulpVerlenerOnly() {
    require(msg.sender == schuldHulpVerlener);
    _;} /*This function checks if changes were made by the municipality, discards other changes*/
   
    constructor() public {
        schuldHulpVerlener = msg.sender;
        ///@param schuldHulpVerlener is the one who initialized the contract. (assumption GDH) 
    }  /* In this step, we created a constructor, or an “initializer” for our contract, once it is deployed in the ethereum blockchain.Every change of state of the Global Ethereum Virtual Machine (EVM), is triggered by a transaction. A transaction has a sender and a recipient. And each of them can be an Ethereum address or a smart contract. In Solidity the “msg” object describes the attributes of the transaction. So by accessing its properties, we can find out information about its state. */ 
    
    function boolGeschikt() public payable schuldHulpVerlenerOnly{
        if(msg.value == 1){
        geschiktVoorSchuldHulpVerlening == true; } else geschiktVoorSchuldHulpVerlening == false;
        ///@param geschiktVoorSchuldHulpVerlening is a param that check if the debtor is suited for help program it's just a truefalse boolean
    } /*This function allows the municipality to change the value of booleans by paying ether*/
    
    function boolKrijgt() public payable schuldHulpVerlenerOnly {
        require(geschiktVoorSchuldHulpVerlening == true);
        if(msg.value == 1){
        krijgtSchuldHulpVerlening == true; } else krijgtSchuldHulpVerlening == false;
        ///@param krijgtSchuldHulpVerlening is a param that check if the debtor is suited for help program it's just a truefalse boolean
    } /*This function allows the municipality to change the value of booleans by paying ether*/
   
    
    
    function participantInSchuldHulpVerlening() public payable { /*The function is defined with 2 properties: a) public, which makes it publicly accessible. b) payable, which allows the function to be triggered by a transaction that sends ether along with it. The ether will be used to fund the smartcontract, and finally, reward the miners on the blockchain.*/
        require(krijgtSchuldHulpVerlening == true); /*The first require function checks if the Debiteur is suited for help*/
        require(msg.value > 0.1 ether); /*The third line uses the built-in function require, which asserts a condition to be true to continue the execution, or else, escape the function. In this case, we want to make sure that whoever triggers his function, transfer along with it more than 0.1 ether, as a condition to decourage scammers. */
        debiteur.push(msg.sender); /*The third line appends the address of the account that triggered the function to the array of debiteur we initialized at the beginning of the contract. */
        ///@param require krijgtSchuldHulpVerlening checks wether or not the debtor is allowed to use this function
        ///@param require msg.value checks if the debtor is willingly to participate by actually pay something
    }
    
    
    function participantderdePartij() public payable { /*The function is defined with 2 properties: a) public, which makes it publicly accessible. b) payable, which allows the function to be triggered by a transaction that sends ether along with it. The ether will be used to fund the smartcontract, and finally, reward the miners on the blockchain.*/
        require(msg.value > 0.1 ether); /*The second line uses the built-in function require, which asserts a condition to be true to continue the execution, or else, escape the function. In this case, we want to make sure that whoever triggers his function, transfer along with it more than 0.1 ether, as a condition to decourage scammers. */
        derdePartij.push(msg.sender); /*The third line appends the address of the account that triggered the function to the array of 3ePartij we initialized at the beginning of the contract. */
        ///@param require check if the third party that wants to participate actually pays something
        ///@param derdePartij.push adds the third partys address in an array
    }    
    
    /* BROKEN SYNTAX !!
    function getDebiteur() public schuldHulpVerlenerOnly view returns( address[]) {
        return debiteur;
    }
    function getDerdePartij() public view returns( address[]) {
        return derdePartij;
    } *//*These two function let the municipality see who's in the arrays*/
    
    
    function cleaningGDPR() public schuldHulpVerlenerOnly {
        debiteur = new address[](0);
        derdePartij = new address[](0);
    } /* after the debiteur is without debt the municipality can clear the records on the blockchain*/
    
        string public name="Mortal";

    function destroy() public  { // note add security
        selfdestruct(msg.sender);
    }

    function destroyAndSend(address payable recipient) public {
      // note add security
    selfdestruct(recipient);
    }
    
      string public MyName="Test publication to Etherscan";
  function SetMyName(string calldata _MyName) external {
     MyName = _MyName;
  }
}