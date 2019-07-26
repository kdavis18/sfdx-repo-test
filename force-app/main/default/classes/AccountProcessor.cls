public with sharing class AccountProcessor {

	@future
	public static void countContacts(List<ID> accountIds){
		List<Account> accounts = new List<Account> ();
		for(Account acct : [select id, Number_of_Contacts__c, (select id from contacts) from account where id in :accountids]){
			if(acct.contacts != null && acct.contacts.size() > 0){
				acct.Number_of_Contacts__c = acct.contacts.size();
				accounts.add(acct);
			}
		}

		if(!accounts.isEmpty()){
			update accounts;
		}
	}
}