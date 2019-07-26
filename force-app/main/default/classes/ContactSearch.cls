public class ContactSearch {

    public static List<Contact> searchForContacts(String name, String zip){
		List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE LastName = :name AND MailingPostalCode =: zip];
        
        return contacts;
    }
}