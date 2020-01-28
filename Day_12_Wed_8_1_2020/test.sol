pragma solidity >=0.4.0 <0.6.0;
      import "remix_tests.sol"; // this import is automatically injected by Remix.
      import "schuldHulpVerlening.sol"; // this import is the contract to be tested.
      

      // file name has to end with '_test.sol'
      contract schuldHulpVerlening_test {

        function beforeAll() public {
          // here should instantiate tested contract
          //Assert.equal(uint(4), uint(3), "error in before all function");
        SHV = new schuldHulpVerlening(); 
        }

        function test_Boolgeschikt() public {
          Assert.equal(uint(SHV.boolGeschikt.getRandom()), uint(1),"number is not equal to 1");
        }
        
        function test_Boolkrijgt() public {
          Assert.equal(uint(SHV.boolKrijgt.getRandom()), uint(1),"number is not equal to 1");
        }
        
        function test_participantInSchuldHulpVerlening() public {
          Assert.Greater(uint(SHV.participantInSchuldHulpVerlening.getRandom()), uint(0.1),"number is greater then 0.1");
        }
        
        function test_participantDerdePartij() public {
          Assert.Greater(uint(SHV.participantDerdePartij.getRandom()), uint(0.1),"number is greater then 0.1");
        }

        function test_Boolgeschikt() public {
          Assert.equal(result, false, "Not allowed to!");
        }
      }
