public class NewCaseListController {

    public NewCaseListController(){
        
    }
    
    public List<Case> getNewCases(){
        return [SELECT Id, CaseNumber FROM Case WHERE Status='New'];
    }
}