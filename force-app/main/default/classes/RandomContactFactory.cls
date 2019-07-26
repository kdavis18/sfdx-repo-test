public class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer num, String lastName){
		Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        List<Contact> contacts = new List<Contact> ();
        
        for(Integer i = 0; i < num; i++){
            contacts.add(new Contact(
                AccountId = acct.Id,
                FirstName = 'Test '+i,
                LastName = lastName
            ));
        }
        
        return contacts;
    }
}