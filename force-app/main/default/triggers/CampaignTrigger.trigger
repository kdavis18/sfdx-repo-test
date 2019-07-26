trigger CampaignTrigger on Campaign (after insert, after update) {

    if(Trigger.isInsert){
        System.enqueueJob(new A());
    }
    
    if(Trigger.isUpdate){
        for(Campaign c: Trigger.new){
            if(c.startDate == DAte.today()){
                 System.enqueueJob(new B());
                 break;
            }
        }
    }
}