const SimpleStorage = artifacts.require("SimpleStorage");
const TutorialToken = artifacts.require("TutorialToken");
const ComplexStorage = artifacts.require("ComplexStorage");
var HelloWorld = artifacts.require("HelloWorld");

module.exports = function(deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(TutorialToken);
  deployer.deploy(ComplexStorage);
  deployer.deploy(HelloWorld);
};
module.exports = deployer => deployer.deploy(artifacts.require("YoutubeViews.sol"))
