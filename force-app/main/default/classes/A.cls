public class A implements Queueable{
    public void execute(QueueableContext context) {
        List<Campaign> c = [SELECT ID, StartDate fROM Campaign WHERE (NAME = 'Kilian Davis' OR StartDate = Today)];
        
        if(!c.isEmpty()){
        
            for(Campaign camp : c){
                if(camp.StartDate == null){
                    camp.StartDate = DATE.today();
                }else{
                    camp.StartDate = Date.today().addDays(-21);
                    camp.Name = 'Done';
                }
            }
            
            update c;
        
        System.enqueueJob(new A());

        }
    }
}