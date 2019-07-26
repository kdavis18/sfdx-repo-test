public class AccountHandler {
    public static Account insertNewAccount(String name){
        Account acct = new Account ();
        acct.Name = name;
        
        try{
            insert acct;
        }catch(Exception e){
            acct = null;
        }
        
        return acct;
    }
}