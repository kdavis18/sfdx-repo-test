trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> tasks = new List<Task> ();
    for(Opportunity opp : trigger.new){
        if(opp.StageName == 'Closed Won'){
            tasks.add(new Task(
                WhatId = opp.Id,
            	subject = 'Follow Up Test Task'	
            ));
        }
    }
    
    if(!tasks.isEmpty()){
        insert tasks;
    }
        
}