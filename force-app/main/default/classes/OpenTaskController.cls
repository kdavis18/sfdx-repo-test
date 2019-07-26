public class OpenTaskController {
    
    @AuraEnabled
    public static List<Task> fetchOpenTask(string objId) {
        
        set<id> contactidSet = new set<id>();
        list<task> taskLst = new list<task>();
        if(objId != null && objId != ''){
            list<account> accList = [SELECT Id, Name, (SELECT id,name FROM Contacts ) FROM Account WHERE Id =: objid];
        
            for (Account a : accList ) {
                for (Contact c : a.Contacts) {
                    System.debug('con==='+c.id);
                    contactidSet.add(c.id);
                }
            }
            
            taskLst = [select id,Subject,whoid,Who.name,ActivityDate,Description from Task where whoid = :contactidSet];
            
        }
        system.debug('taskLst==='+taskLst+taskLst[0].Who.name);
        if(taskLst !=  null && taskLst.size() > 0){
            return taskLst ;
        }else{
            return null;
        }
        
    }
    
    
    }