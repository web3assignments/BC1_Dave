const path = require("path");
const mnemonix = fs.readFileSync(".secret");
	.toString().trim(); // contains mnemonic
const infurakey = fs.readFileSync(".infura");
	.toString().trim(); // infura key

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "app/src/contracts"),
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    } 
  }
};
