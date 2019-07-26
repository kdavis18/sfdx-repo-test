trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tasks = new List<Task> ();
    for(Order_Event__e e : Trigger.new){
        if(e.Has_Shipped__c){
            tasks.add(new Task(
            Priority='Medium',
            Status='New',
            Subject='Follow up on shipped order ' + e.Order_Number__c,
            OwnerId=UserInfo.getUserId()
          ));
        }
    }
    
    insert tasks;
}