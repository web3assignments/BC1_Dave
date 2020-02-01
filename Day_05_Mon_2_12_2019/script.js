function log(logstr) {
    document.getElementById("log").innerHTML += logstr + "\n";
}
web3 = new Web3(Web3.givenProvider); // provider from metamask         
web3.extend({ // web3.eth.requestAccounts() isn't available (yet)
    methods: [{
        name: 'eth_requestAccounts',
        call: 'eth_requestAccounts',
        params: 0
    }]
});
async function foo() {
    log(`Version of web3.js: ${web3.version}`);
    var result = await web3.eth_requestAccounts().catch(x => log(x.message));
    log(`Value from eth_requestAccounts: ${JSON.stringify(result)}`);
    var acts = await web3.eth.getAccounts().catch(log);
    log(`Here are the accounts: ${JSON.stringify(acts)}`);

    ethereum.on('accountsChanged', newacts => {
        acts = newacts;
        log(`We have new accounts: ${JSON.stringify(acts)}`);
    })
}

const myTotalInsultsABI = [{
    "constant": true,
    "inputs": [],
    "name": "My_Total_Insults",
    "outputs": [{
        "name": "",
        "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}];

const insultAddress = "0x36bF8bB98fEa2C40b98df6C648C88CeF4B3FD1aB";
const myTotalInsultsV2 = new web3.eth.Contract(myTotalInsultsABI, insultAddress);
async function f() {
    var result = await myTotalInsultsV2.methods.My_Total_Insults().call();
    log(`There are ${result} insults`);
    log('This has been published by 0x9c10f03a4B532Ef8928f4f73F92b6c4F0421A8aF');
}
foo();
