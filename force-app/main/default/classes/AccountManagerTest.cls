@isTest
private class AccountManagerTest {
    
	@isTest static void testGetAccount() {
		Account acct = new Account(Name = 'Test Account');
		insert acct;

		Contact c = new Contact(FirstName = 'Bill', LastName = 'Bob', AccountId = acct.Id);
		insert c;

		RestRequest request = new RestRequest();
		request.requestURI = '/Accounts/'+acct.Id+'/contacts';
		request.httpMethod = 'GET';

		RestContext.request = request;

		Account thisAccount = AccountManager.getAccount();
		System.assert(thisAccount.Name == 'Test Account');
		System.assert(thisAccount.Contacts.size() > 0);
	}	
}