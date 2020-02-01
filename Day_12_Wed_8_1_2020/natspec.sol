pragma solidity ^0.5.2;

/// @title a program for the Gemeente Den Haag
/// @author Evert M. Roelofsen
/// @notice this is still very basic
/// @dev all function work except the last three
contract schuldHulpVerlening {
    /// @author Evert M. Roelofsen (still me!)
    /// @notice This is developed for the municipality The Hague.
    /// @dev this contract has been deployed without parameters befor
    
    
    address public schuldHulpVerlener; /* This is the way in which we initialize the variable in our contract called schuldHulpVerlener, that holds a value of type address, and it has a public access property, which means an api, or a WebApp can read it. */
    address[] public debiteur; /* This is a variable named debiteur, that references a dynamic array of addresses, which also has public access, so other smart contracts or apis can read the participants in this array. */
    address[] public derdePartij; //this function isn't used for now; will be developed in Beta version.
    string public MyName="Test publication to Etherscan";
    string public name="Mortal";
    bool geschiktVoorSchuldHulpVerlening;
    bool krijgtSchuldHulpVerlening;
    
    modifier schuldHulpVerlenerOnly() {
    require(msg.sender == schuldHulpVerlener);
    _;} /*This function checks if changes were made by the municipality, discards other changes*/
    
    constructor() public {
        schuldHulpVerlener = msg.sender;
    } /* In this step, we created a constructor, or an “initializer” for our contract, once it is deployed in the ethereum blockchain.Every change of state of the Global Ethereum Virtual Machine (EVM), is triggered by a transaction. A transaction has a sender and a recipient. And each of them can be an Ethereum address or a smart contract. In Solidity the “msg” object describes the attributes of the transaction. So by accessing its properties, we can find out information about its state. */ 
    
    
    /// @param recipient, sets the selfdestruct recipient.
    function destroyAndSend(address payable recipient) public {  // note add security
    selfdestruct(recipient);
    }
    
    /// @param _MyName, this sets _MyName input as MyName
    function SetMyName(string calldata _MyName) external {
     MyName = _MyName;
    }
   
    /// @dev function that checks if the debtor is suitable for help.
    function boolGeschikt() public payable schuldHulpVerlenerOnly{
        if(msg.value == 1){
        geschiktVoorSchuldHulpVerlening == true; } else geschiktVoorSchuldHulpVerlening == false;
    } /*This function allows the municipality to change the value of booleans by paying ether*/
    
    /// @dev function that checks if the debtor is getting  help.
    function boolKrijgt() public payable schuldHulpVerlenerOnly {
        require(geschiktVoorSchuldHulpVerlening == true);
        if(msg.value == 1){
        krijgtSchuldHulpVerlening == true; } else krijgtSchuldHulpVerlening == false;
    } /*This function allows the municipality to change the value of booleans by paying ether*/
   
    /// @dev public payable function where the debtor can registrate
    function participantInSchuldHulpVerlening() public payable { /*The function is defined with 2 properties: a) public, which makes it publicly accessible. b) payable, which allows the function to be triggered by a transaction that sends ether along with it. The ether will be used to fund the smartcontract, and finally, reward the miners on the blockchain.*/
        require(krijgtSchuldHulpVerlening == true); /*The first require function checks if the Debiteur is suited for help*/
        require(msg.value > 0.1 ether); /*The third line uses the built-in function require, which asserts a condition to be true to continue the execution, or else, escape the function. In this case, we want to make sure that whoever triggers his function, transfer along with it more than 0.1 ether, as a condition to decourage scammers. */
        debiteur.push(msg.sender); /*The third line appends the address of the account that triggered the function to the array of debiteur we initialized at the beginning of the contract. */
    }
    
    /// @dev public payable function where the third party can registrate
    function participantderdePartij() public payable { /*The function is defined with 2 properties: a) public, which makes it publicly accessible. b) payable, which allows the function to be triggered by a transaction that sends ether along with it. The ether will be used to fund the smartcontract, and finally, reward the miners on the blockchain.*/
        require(msg.value > 0.1 ether); /*The second line uses the built-in function require, which asserts a condition to be true to continue the execution, or else, escape the function. In this case, we want to make sure that whoever triggers his function, transfer along with it more than 0.1 ether, as a condition to decourage scammers. */
        derdePartij.push(msg.sender); /*The third line appends the address of the account that triggered the function to the array of 3ePartij we initialized at the beginning of the contract. */
    }    
    
    /// @dev function that empties the arrays of Debiteur and derdePartij;
    function emptyArray() public schuldHulpVerlenerOnly {
        debiteur = new address[](0);
        derdePartij = new address[](0);
    } /* after the debiteur is without debt the municipality can clear the records on the blockchain*/
    
    /// @dev function that selfdestructs the contract
    function destroy() public  { // note add security
        selfdestruct(msg.sender);
    }
    
    /* BROKEN SYNTAX !!
    function getDebiteur() public schuldHulpVerlenerOnly view returns( address[]) {
        return debiteur;
    }
    function getDerdePartij() public view returns( address[]) {
        return derdePartij;
    } *//*These two function let the municipality see who's in the arrays*/
}
