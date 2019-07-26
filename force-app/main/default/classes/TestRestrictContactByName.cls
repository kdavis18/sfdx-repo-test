@isTest
private class TestRestrictContactByName {
    @isTest static void testInvalidName(){
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Contact c = new Contact(AccountId = acct.Id, FirstName = 'Bill', LastName = 'INVALIDNAME');
        try{
            insert c;
        }catch(Exception e){
            
        }
    }
}