pragma solidity >=0.4.0 <0.6.0;
      import "remix_tests.sol"; // this import is automatically injected by Remix.
      import "schuldHulpVerlening.sol"; //added
      
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
           // SHV.participantderdePartij(); //  geen argumenten bij definitie van functie (was true)
           Assert.equal(SHV.NrOfDerdePartij(), 1, "NrOFDerdePartij should be 1 now");   // NrOFDerdePartij ==> NrOfDerdePartij
           Assert.equal(address(SHV.derdePartij(1)), address(SHV.schuldHulpVerlener), "NrOFDerdePartij should be owner"); // schuldHulpVerlener  was  SHV.owner()
           Assert.equal(SHV.NrOfDebiteur(), 1, "NrOfDebiteur should be 1 now");
           Assert.equal(address(SHV.debiteur(1)), address(SHV.schuldHulpVerlener), "Should be 1");     // was SHV.owner()
        }
      }
