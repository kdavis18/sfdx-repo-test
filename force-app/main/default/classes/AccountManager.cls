@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

	@HttpGet
	global static Account getAccount(){
		Account acct = new Account();
		RestRequest request = RestContext.request;
		String uri = request.requestURI;
		System.debug(uri);
		Integer startIndex = uri.indexOf('Accounts/');
		Integer endIndex = uri.indexOf('/contacts');

		if(startIndex > 0 && endIndex > 0){
			String acctId = uri.substring(startIndex+9,endIndex);

			if(acctId != null && (acctId.length() == 15 || acctId.length() == 18)){
				acct = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERe Id =: acctId];
			}
		}

		return acct;
	}
}