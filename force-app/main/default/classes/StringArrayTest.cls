public class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
        List<String> returnStrings = new List<String> ();
        
        for(Integer i = 0; i < n; i++){
        	String val = 'Test '+i;
            returnStrings.add(val);
        }
        
        return returnStrings;
    }
    
}