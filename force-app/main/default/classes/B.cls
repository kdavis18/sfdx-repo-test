public class B implements Queueable{
    public void execute(QueueableContext context) {
        List<Campaign> c = [SELECT ID fROM Campaign WHERE NAME = 'Kilian Davis' AND StartDate != null AND EndDate = NULL];
        
        for(Campaign camp : c){
            camp.EndDate = DATE.today();
        }
        
        update c;  
    }
}