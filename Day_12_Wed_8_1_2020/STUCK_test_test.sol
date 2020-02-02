pragma solidity >=0.4.0 <0.6.0;
      import "remix_tests.sol"; // this import is automatically injected by Remix.

      // file name has to end with '_test.sol'
      contract schuldhulpverleningTest {
          schuldHulpVerlening SHV;

        function beforeAll() public {
            SHV = new schuldHulpVerlening();
            Assert.equal(SHV.NrOfDebiteur(), 0, "This number needs to be 0 te begin with");
            Assert.equal(SHV.debiteur(0), address(0), "The address in this list should be 0");
            Assert.equal(SHV.NrOfDerdePartij(), 0, "This number needs to be 0 to begin with");
            Assert.equal(SHV.derdePartij(0), address(0), "The address in this list should be 0");
        }

        function participantderdePartijTest() public {
            SHV.participantderdePartij(true);
            Assert.equal(SHV.NrOFDerdePartij(), 1, "NrOFDerdePartij should be 1 now");
            Assert.equal(SHV.derdePartij(1), (SHV.owner()), "NrOFDerdePartij should be owner");
            Assert.equal(SHV.NrOfDebiteur(), 1, "NrOfDebiteur should be 1 now");
            Assert.equal(SHV.debiteur(1), (SHV.owner()), "Should be 1");
        }
      }
