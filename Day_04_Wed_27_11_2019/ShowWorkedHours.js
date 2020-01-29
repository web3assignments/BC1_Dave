const Web3 = require('web3');
const web3 = new Web3 ('https://ropsten.infura.io');

await window.ethereum.enable();

const WorkedHours = web3.eth.Contract(contract_abi, contract_address);

WorkedHours.methods.NrofAddress().call();

