public class ContactDetailController {
    @AuraEnabled
    public static void insertContact(String fName, String lName, String accId){
        system.debug('first='+fName+' lName='+lName+' accId='+accId);
        Contact c = new Contact();
        c.FirstName = fName;
        c.LastName = lName;
        c.AccountId = accId;
        insert c;
    }
    
    @AuraEnabled
    public static List<Contact> conList(String accId){
        List<Contact> conList = [Select id, name from Contact where AccountId=:accId];
        return conList;
    }
    
    @AuraEnabled
    public static void saveActivity(String activityDate, String subject, String comments, String contact, String accId){
       system.debug('save activity');
        Task t = new Task();
        t.ActivityDate = Date.valueOf(activityDate);
        t.Subject = subject;
        t.Description = comments;
        //t.AccountId = accId;
        t.WhoId = contact;
       insert t;
        system.debug('success');
    }
    @AuraEnabled
    public static List<EventWrapper> activitiesList(String accId){
        List<Contact> conTaskList = [Select Id, Name, (Select Id, WhoId,ActivityDate,Subject,Description  FROM Tasks) FROM Contact where AccountId=:accId];
        List<Contact> conEventList = [Select Id, Name, (Select Id, WhoId,ActivityDate,Subject,Description  FROM Events) FROM Contact where AccountId=:accId];
        //List<Contact> conCalList = [Select Id, Name, (Select Id, WhoId,ActivityDate,Subject,Description  FROM Calender) FROM Contact where AccountId=:accId];
		Map<String,List<Task>> taskmap = new Map<String,List<Task>>();
        for(Contact c : conTaskList){
            taskmap.put(c.Id,c.Tasks);
            
        }
        Map<Id,Contact> conMap = new Map<Id,Contact>([Select id, Name from Contact]);
        List<EventWrapper> eWrapList = new List<EventWrapper>();
        for(Contact c: conTaskList){
            
            for(Task t : c.Tasks)
            {
                EventWrapper eWrap = new EventWrapper();
                 eWrap.ContactName = c.Name;
                eWrap.ActivityDate = String.valueOf(t.ActivityDate);
                eWrap.Subject = t.Subject;
                eWrap.Comments= t.Description;
                eWrapList.add(eWrap);
               
            }
            
            
        }
        system.debug(eWrapList);
        return eWrapList;
        
       /* for(Contact c: conEventList){
            EventWrapper eWrap = new EventWrapper();
            eWrap.ContactName = c.Name;
            eWrap.ActivityDate = c.Event.ActivityDate;
            eWrap.Subject = c.Event.Subject;
            eWrap.Comments= c.Event.Description;
            eWrapList.add(eWrap);
        }*/
        /*for(Contact c: conCalList){
            EventWrapper eWrap = new EventWrapper();
            eWrap.ContactName = c.Name;
            eWrap.ActivityDate = c.Task.ActivityDate;
            eWrap.Subject = c.Task.Subject;
            eWrap.Comments= c.Task.Description;
            eWrapList.add(eWrap);
        }*/
    }
}