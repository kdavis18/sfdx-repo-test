@isTest
private class AccountProcessorTest {
	
	@isTest static void testContactCount() {
		Account acct = new Account(Name='Account');
		insert acct;

		Contact a = new Contact(FirstName = 'A', LastName='Smith', AccountId = acct.Id);
		insert a;
		Contact b = new Contact(FirstName = 'B', LastName='Smith', AccountId = acct.Id);
		insert b;

		Test.startTest();
			AccountProcessor.countContacts(new List<ID>{acct.Id});
		Test.stopTest();
	}
	
}