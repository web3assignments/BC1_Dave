const Web3 = require('web3');
const web3 = new Web3('https://ropsten.infura.io');
const TestPayABI = [{
    "constant": true,
    "inputs": [],
    "name": "Balance",
    "outputs": [{
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}];
async function f() {
    const TestPayaddress = "0x0060f37cdb9e045F4017BfA5d26A73A0F0601Fd2"
    const ContractTestPay = new web3.eth.Contract(TestPayABI, TestPayaddress);
    var result = await ContractTestPay.methods.ContractBalance().call();
    console.log(`ContractBalance shows ${Web3.utils.fromWei(result)} ether`);
    var x = Web3.utils.fromWei(await web3.eth.getBalance(TestPayaddress), 'ether');
    console.log(`TestPayaddress ${TestPayaddress} has ${x} ether`);
}
f();
