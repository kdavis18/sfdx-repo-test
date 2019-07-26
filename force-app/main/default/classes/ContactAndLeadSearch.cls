public class ContactAndLeadSearch {
    public static List<List<Sobject>> searchContactsAndLeads(String s){
        List<List<Sobject>> results = [FIND :s IN NAME FIELDS RETURNING Lead(FirstName, LastName),Contact(FirstName,LastName)];
        
        return results;
    }
}