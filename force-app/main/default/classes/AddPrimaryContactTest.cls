@isTest
private class AddPrimaryContactTest {
	
	@isTest static void test() {
		List<Account> accts = new List<Account> ();

		for(Integer i=0; i<50; i++){
			accts.add(new Account(
				Name = 'Test Account NY'+i,
				BillingState = 'NY'
			));
		}

		for(Integer i=0; i<50; i++){
			accts.add(new Account(
				Name = 'Test Account CA'+i,
				BillingState = 'CA'
			));
		}

		insert accts;

		Contact c = new Contact(FirstName = 'Bill', LastName = 'Test');

		Test.startTest();
			System.enqueueJob(new AddPrimaryContact(c, 'CA'));
		Test.stopTest();

		for(Account acct : [SELECT Id, (SELECT Id FROM contacts) FROM Account where BillingState = 'CA']){
			System.assert(acct.contacts.size() > 0);
		}
	}
	
}