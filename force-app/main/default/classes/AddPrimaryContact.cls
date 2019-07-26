public class AddPrimaryContact implements Queueable{

	private Contact c;
	private String state;

	public AddPrimaryContact(Contact c, String state){
		this.c = c;
		this.state = state;
	}

	public void execute(QueueableContext qc){
		List<Contact> contacts = new List<Contact> ();

		for(Account acct : [SELECT Id FROM Account WHERE BillingState = :state]){
			Contact newContact = c.clone(false, true, false, false);
			newContact.AccountId = acct.Id;

			contacts.add(newContact);
		}

		insert contacts;
	}
}